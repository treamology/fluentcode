import * as React from 'react';
import * as ReactDOM from 'react-dom';
import '../styles/editor.scss';
import 'codemirror/mode/python/python';
import { Actions } from '../state/actions';
import * as ReactCodeMirror from 'react-codemirror';
import { connect, Dispatch } from 'react-redux';
import { AnyAction } from 'redux';
import { CodeEditorState, ApplicationState } from '../state/types/state';
import { DroppedCodeItem } from './draggable';
import { DropTarget, DropTargetMonitor, DropTargetConnector, DndComponentClass } from 'react-dnd';
import TextBoxWidget, { TextBoxProps, TextBoxDimensions } from './widgets/textbox';
import { DraggableTextField } from '../models';

// For some reason CodeMirror doesn't provide this.
interface CoordsType { left: number; right: number; top: number; bottom: number; }

interface CodeEditorProps {
    updateCodeState: (newCode: string) => AnyAction;
    setTextboxes: (changes: {}, data: Map<CodeMirror.LineHandle, Array<DraggableTextField>>) => AnyAction;
    textboxProps: {};
    textboxData: Map<CodeMirror.LineHandle, Array<DraggableTextField>>;
}

// Extra props from the drag/drop library.
interface CodeEditorPropsCollected extends CodeEditorProps {
    connectDropTarget: Function;
    isOver: boolean;
}

// Component just for holding the textboxes that gets attached to a div in the editor.
interface EditorOverlayProps {
    textBoxWidgets: Array<JSX.Element>;
}

class EditorOverlay extends React.Component<EditorOverlayProps, {}> {
    render() {
        return <div>{this.props.textBoxWidgets.map((widget) => widget)}</div>;
    }
}

class UnwrappedCodeEditor extends React.Component<CodeEditorPropsCollected> {
    static TAB_SIZE = 4;
    static TAB_REPLACEMENT = Array(UnwrappedCodeEditor.TAB_SIZE + 1).join(' '); // replace tab characters with 4 spaces
    static MAGIC_CHARACTER = '\\\\';
    
    editor: ReactCodeMirror.ReactCodeMirror;

    // Since CodeMirror isn't using React, we need to have a div to render into (the div gets turned
    // into a CodeMirror widget)
    tbContainerDiv: HTMLDivElement;
    currentTbWidgets: Array<JSX.Element>;

    lastDrop?: DroppedCodeItem;
    dirtyLines: number[] = [];

    constructor(props: CodeEditorPropsCollected) {
        super(props);

        this.tbContainerDiv = document.createElement('div');

        this.state = {
            lastDrop: undefined
        };
    }

    render() {
        // Make TextBoxWidgets based on the textboxProps state.
        this.currentTbWidgets = [];
        for (let line of Object.keys(this.props.textboxProps)) {
            let list: Array<TextBoxProps> = this.props.textboxProps[line];
            if (!list) { continue; }
            for (let tbIndex of Object.keys(list)) {
                let props = list[tbIndex];
                this.currentTbWidgets.push(
                    <TextBoxWidget
                        absDimensions={props.absDimensions}
                        placeholderText={props.placeholderText}
                        key={Number(line + tbIndex)}
                    />
                );
            }
        }
        
        return this.props.connectDropTarget(
            <div className="editor_container">
                <ReactCodeMirror
                    ref={(editor: ReactCodeMirror.ReactCodeMirror) => this.editor = editor}
                    className="editor"
                    onChange={this.props.updateCodeState}
                    options={{
                        mode: 'python',
                        lineNumbers: true,
                        tabSize: UnwrappedCodeEditor.TAB_SIZE,
                        indentUnit: UnwrappedCodeEditor.TAB_SIZE,
                        extraKeys: {
                            'Tab': (cm: CodeMirror.Editor) => {
                                cm.getDoc().replaceSelection(UnwrappedCodeEditor.TAB_REPLACEMENT, 'end');
                            }
                        }
                    }}
                />
            </div>
        );
    }

    componentDidUpdate() {
        // You can't render something else inside a call to render so this needs to be here.
        // Places the container for the textboxes inside the div we created earlier.
        ReactDOM.render(<EditorOverlay textBoxWidgets={this.currentTbWidgets}/>, this.tbContainerDiv);
    }

    componentDidMount() {
        let cm = this.editor.getCodeMirror();

        // Make the container div a widget so it sticks to each line of the editor.
        // CM changes the positioning when you call this function so some styling needs to be applied afterward.
        // We're anchoring this to the first character of the first line (which can't be deleted), and getting
        // rid of the margins. Now the textboxes can be added anywhere we want.
        cm.addWidget({line: 0, ch: 0}, this.tbContainerDiv, false);
        this.tbContainerDiv.style.top = '0px';
        this.tbContainerDiv.style.left = '0px';

        cm.on('beforeChange', this.calculateTextboxDeletionChanges.bind(this));
    }

    // tslint:disable-next-line
    dropCode(code: DroppedCodeItem, coords: any) {
        let codemirrorInstance: CodeMirror.Editor = this.editor.getCodeMirror();

        this.lastDrop = code;
        let charCoords = codemirrorInstance.coordsChar({
            left: coords.x,
            top: coords.y
        });

        let validBound = this.checkIfDragValid.bind(this)
        let calcBound = this.calculateTextboxChanges.bind(this)
        codemirrorInstance.on('beforeChange', validBound);
        codemirrorInstance.on('change', calcBound);
        codemirrorInstance.getDoc().replaceRange(code.droppedCode, charCoords);
        codemirrorInstance.off('beforeChange', validBound);
        codemirrorInstance.off('change', calcBound);
    }

    // Don't allow dragging onto a line that already has a box
    checkIfDragValid(cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable) {
        if (!this.lastDrop) return;
        let lastDrop = this.lastDrop;

        for (let index = 0; index < lastDrop.textFields.length; index++) {
            let realLine = index + change.from.line;
            let handle = cm.getDoc().getLineHandle(realLine);
            let tbData = this.props.textboxData.get(handle)
            if (tbData && tbData.length !== 0) {
                change.cancel();
                return;
            }
        }
    }

    calculateTextboxDeletionChanges(
        cm: CodeMirror.Editor,
        change: CodeMirror.EditorChangeCancellable) {

        let textboxData = new Map<CodeMirror.LineHandle, Array<DraggableTextField>>([...this.props.textboxData]);
        let tbChanges = {} // For rendering

        if (change.origin === '+delete') { // Text is being removed, so we must remove textboxes accordingly
            for (let line = change.from.line; line <= change.to.line; line++) {
                let handle = cm.getDoc().getLineHandle(line);
                let data = textboxData.get(handle);
                let newData: DraggableTextField[] = [];
                if (!data) { continue; }

                for (let key of Object.keys(data)) {
                    let box = data[key];

                    let selectionEndBound = change.to.ch;
                    // Check if this is the last line
                    if (line !== change.to.line) {
                        selectionEndBound = cm.getDoc().getLine(line).length;
                    }

                    if ((box.startChar >= change.from.ch && box.endChar <= selectionEndBound) ||
                        (box.startChar >= change.from.ch && box.startChar <= selectionEndBound) ||
                        (box.endChar >= change.from.ch && box.endChar <= selectionEndBound)) {
                        
                        continue;
                    }
                    newData.push(data[key]);
                }

                this.dirtyLines.push(line)
                if (newData.length === 0) { tbChanges[line] = null; }
                textboxData.set(handle, newData)
            }
            this.calculateTextboxChanges(cm, change);
        }

        this.props.setTextboxes(tbChanges, textboxData);
    }


    calculateTextboxChanges(
        cm: CodeMirror.Editor, 
        change: CodeMirror.EditorChangeLinkedList | CodeMirror.EditorChangeCancellable) {
    
        let textboxData = new Map<CodeMirror.LineHandle, Array<DraggableTextField>>([...this.props.textboxData]);
        let tbChanges = {} // For rendering

        

        if (!this.lastDrop) return;

        let dirtyFields: DraggableTextField[] = [];
        for (let line of this.dirtyLines) {
            let handle = cm.getDoc().getLineHandle(line)
            dirtyFields = dirtyFields.concat(this.props.textboxData.get(handle)!);
        }
        if (this.dirtyLines.length === 0) {
            dirtyFields = dirtyFields.concat(this.lastDrop.textFields);
        }
        this.dirtyLines = [];

        for (let index = 0; index < dirtyFields.length; index++) {
            let field: DraggableTextField = dirtyFields[index];
            let realLine = index + change.from.line;
            let handle = cm.getDoc().getLineHandle(realLine);
            
            if (!textboxData.has(handle)) {
                textboxData.set(handle, []);
            }
            textboxData.get(handle)!.push(field);

            // Set up rendering props
            let absChar = change.from.ch + field.startChar;
            let firstCharPos: CodeMirror.Position = { line: realLine, ch: absChar };
            let firstCharCoords: CoordsType = cm.charCoords(firstCharPos, 'local');
            let lastCharPos: CodeMirror.Position = { line: realLine, ch: change.from.ch + field.endChar };
            let lastCharCoords: CoordsType = cm.charCoords(lastCharPos, 'local');

            let width = lastCharCoords.right - firstCharCoords.left;
            let height = lastCharCoords.bottom - lastCharCoords.top;

            let dimensions: TextBoxDimensions = {
                x: firstCharCoords.left,
                y: firstCharCoords.top,
                width: width,
                height: height
            };

            if (!tbChanges[realLine]) {
                tbChanges[realLine] = [];
            }
            tbChanges[realLine].push({ absDimensions: dimensions, placeholder: field.placeholderText });
            
        }

        this.props.setTextboxes(tbChanges, textboxData);
    }
}


// function calculateTextboxChanges(
//         cm: CodeMirror.Editor, 
//         change: CodeMirror.EditorChangeCancellable,
//         dispatch: Dispatch<CodeEditorState>) {

//     const mc = UnwrappedCodeEditor.MAGIC_CHARACTER;
//     const re = new RegExp(mc + '.*?' + mc, 'g');

//     let tbChanges = {}; // the 'delta' object

//     for (let relLineNum of Object.keys(change.text)) {
//         let text = change.text[relLineNum];
//         let absLine = change.from.line + Number(relLineNum);

//         let lineChanges: Array<TextBoxProps> = [];

        

//         // exec() only finds one thing at a time, so we have to loop through calling it repeatedly
//         let foundExp;
//         while ((foundExp = re.exec(text)) !== null) {
//             let absChar = change.from.ch + foundExp.index;
//             let firstCharPos: CodeMirror.Position = { line: absLine, ch: absChar };
//             let firstCharCoords: CoordsType = cm.charCoords(firstCharPos, 'local');
//             let lastCharPos: CodeMirror.Position = { line: absLine, ch: absChar + (foundExp[0].length - 1) };
//             let lastCharCoords: CoordsType = cm.charCoords(lastCharPos, 'local');

//             let width = lastCharCoords.right - firstCharCoords.left;
//             let height = lastCharCoords.bottom - lastCharCoords.top;

//             let dimensions: TextBoxDimensions = {
//                 x: firstCharCoords.left,
//                 y: firstCharCoords.top,
//                 width: width,
//                 height: height
//             };

//             let placeholder = foundExp[0].replace(/\\/g, '');

//             lineChanges.push({ absDimensions: dimensions, placeholderText: placeholder });
//         }

//         // If there are no textboxes, set it to undefined so it gets removed from the state
//         if (lineChanges.length === 0) {
//             tbChanges[absLine] = null;
//             continue;
//         }
//         tbChanges[absLine] = lineChanges;
//     }

//     return dispatch(Actions.setTextboxes(tbChanges));
// }

const dropTarget = {
    drop(props: CodeEditorProps, monitor: DropTargetMonitor, component: UnwrappedCodeEditor) {
        let item: DroppedCodeItem = monitor.getItem() as DroppedCodeItem;
        component.dropCode(item, monitor.getClientOffset());
    }
};

function collect(dropConnect: DropTargetConnector, monitor: DropTargetMonitor) {
    return {
        connectDropTarget: dropConnect.dropTarget(),
        isOver: monitor.isOver()
    };
}

const mapDispatchToProps = (dispatch: Dispatch<CodeEditorState>) => {
    return {
        updateCodeState: (newCode: string) => {
            dispatch(Actions.setCode(newCode));
        },
        setTextboxes: (changes: {}, data: Map<CodeMirror.LineHandle, Array<DraggableTextField>>) => {
            dispatch(Actions.setTextboxes(changes));
            dispatch(Actions.setTextboxData(data));
        }
    };
};

const mapStateToProps = (state: ApplicationState) => {
    return {
        textboxProps: state.codeEditor.textBoxes,
        textboxData: state.codeEditor.textboxData
    };
};

const UnconnectedCodeEditor: DndComponentClass<CodeEditorProps> = 
    DropTarget('Draggable', dropTarget, collect)(UnwrappedCodeEditor);

const CodeEditor = connect(mapStateToProps, mapDispatchToProps)(UnconnectedCodeEditor);

export default CodeEditor;