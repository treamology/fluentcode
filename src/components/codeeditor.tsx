import * as React from 'react';
import * as ReactDOM from 'react-dom';

import '../styles/editor.scss';
import 'codemirror/mode/python/python';
import { UnconnectedWidgetContainer, WidgetContainer, TextOperation } from './widgets';
import { Actions } from '../state/actions';
import * as ReactCodeMirror from 'react-codemirror';
import { connect, Dispatch, Provider } from 'react-redux';
import { AnyAction } from 'redux';
import { CodeEditorState, ApplicationState } from '../state/types/state';
import { DroppedCodeItem } from './draggable';
import { DropTarget, DropTargetMonitor, DropTargetConnector, DndComponentClass } from 'react-dnd';
// import TextBoxWidget, { TextBoxProps, TextBoxDimensions } from './widgets/textbox';
import { DraggableTextField } from '../models';
import Store from '../store';

// For some reason CodeMirror doesn't provide this.
// interface CoordsType { left: number; right: number; top: number; bottom: number; }

interface CodeEditorProps {
    updateCodeState: (newCode: string) => AnyAction;
    setTextboxData: (data: Map<CodeMirror.LineHandle, Array<DraggableTextField>>) => AnyAction;
    // setTextboxChanges: (changes: {}) => AnyAction;
    setCodeMirror: (cm: CodeMirror.Editor) => AnyAction;
    // textboxProps: Map<CodeMirror.LineHandle, Array<TextBoxProps>>;
    textboxData: Map<CodeMirror.LineHandle, Array<DraggableTextField>>;
}

// Extra props from the drag/drop library.
interface CodeEditorPropsCollected extends CodeEditorProps {
    connectDropTarget: Function;
    isOver: boolean;
}

// Component just for holding the textboxes that gets attached to a div in the editor.
// interface EditorOverlayProps {
//     textBoxWidgets: Array<JSX.Element>;
// }

// class EditorOverlay extends React.Component<EditorOverlayProps, {}> {
//     render() {
//         return <div>{this.props.textBoxWidgets.map((widget) => widget)}</div>;
//     }
// }

class UnwrappedCodeEditor extends React.Component<CodeEditorPropsCollected> {
    static TAB_SIZE = 4;
    static TAB_REPLACEMENT = Array(UnwrappedCodeEditor.TAB_SIZE + 1).join(' '); // replace tab characters with 4 spaces
    static MAGIC_CHARACTER = '\\\\';
    
    editor: ReactCodeMirror.ReactCodeMirror;
    widgetContainer: UnconnectedWidgetContainer;
    // Since CodeMirror isn't using React, we need to have a div to render into (the div gets turned
    // into a CodeMirror widget)
    tbContainerDiv: HTMLDivElement;
    currentTbWidgets: Array<JSX.Element>;

    lastDrop?: DroppedCodeItem;
    dirtyLines: CodeMirror.LineHandle[] = [];

    validBound: (cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable) => void;
    dataBound: (cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable) => void;
    calcBound: (cm: CodeMirror.Editor, change: CodeMirror.EditorChangeLinkedList) => void;

    constructor(props: CodeEditorPropsCollected) {
        super(props);

        this.tbContainerDiv = document.createElement('div');

        this.state = {
            lastDrop: undefined
        };

        this.validBound = this.checkIfDragValid.bind(this);
        // this.calcBound = this.calculateTextboxRenderChanges.bind(this);
        // this.dataBound = this.calculateTextboxDataChanges.bind(this);
    }

    render() {
        // Make TextBoxWidgets based on the textboxProps state.
        this.currentTbWidgets = [];

        // if (this.editor) {
        //     let cm = this.editor.getCodeMirror();
        //     for (let key of this.props.textboxProps.keys()) {
        //         let list = this.props.textboxProps.get(key)!;
        //         let line = cm.getDoc().getLineNumber(key);
        //         if (!list) { continue; }
        //         for (let tbIndex of Object.keys(list)) {
        //             let props = list[tbIndex];
        //             this.currentTbWidgets.push(
        //                 <TextBoxWidget
        //                     absDimensions={props.absDimensions}
        //                     placeholderText={props.placeholderText}
        //                     key={Number(line + tbIndex)}
        //                     onChange={props.onChange}
        //                 />
        //             );
        //         }
        //     }
        // }
        
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

    renderWidgetContainer() {
        ReactDOM.render(
        (
            <Provider store={Store.getInstance()}>
                <WidgetContainer 
                    cm={this.editor.getCodeMirror()}
                    ref={(container: any) => {
                        if (container) {
                            this.widgetContainer = container.getWrappedInstance() 
                        }
                    }}
                    />
            </Provider>
        ), this.tbContainerDiv);
    }

    componentDidUpdate() {
        // You can't render something else inside a call to render so this needs to be here.
        // Places the container for the textboxes inside the div we created earlier.
        //ReactDOM.render(<EditorOverlay textBoxWidgets={this.currentTbWidgets}/>, this.tbContainerDiv);
        this.renderWidgetContainer();
    }

    componentDidMount() {
        let cm = this.editor.getCodeMirror();
        this.renderWidgetContainer();

        // Make the container div a widget so it sticks to each line of the editor.
        // CM changes the positioning when you call this function so some styling needs to be applied afterward.
        // We're anchoring this to the first character of the first line (which can't be deleted), and getting
        // rid of the margins. Now the textboxes can be added anywhere we want.
        cm.addWidget({line: 0, ch: 0}, this.tbContainerDiv, false);
        this.tbContainerDiv.style.top = '0px';
        this.tbContainerDiv.style.left = '0px';

        cm.on('beforeChange', (instance, changeObj) => {
            let operation: TextOperation = TextOperation.insert;
            if (changeObj.origin === "+delete") {
                operation = TextOperation.delete;
            }
            if (!this.widgetContainer) {
                return true;
            }
            return this.widgetContainer.checkChange(operation, changeObj.text.join('\n'), changeObj.from, changeObj.to, this.lastDrop);
        });
        cm.on('change', (instance, changeObj) => {
            let operation: TextOperation = TextOperation.insert;
            if (changeObj.origin === "+delete") {
                operation = TextOperation.delete;
            }

            if (this.widgetContainer) {
                this.widgetContainer.textChanged(operation, changeObj.text.join('\n'), changeObj.from, changeObj.to, this.lastDrop);
            }
            this.lastDrop = undefined;
        })

        this.props.setCodeMirror(cm);
    }

    // tslint:disable-next-line
    dropCode(code: DroppedCodeItem, coords: any) {
        let codemirrorInstance: CodeMirror.Editor = this.editor.getCodeMirror();

        this.lastDrop = code;
        let charCoords = codemirrorInstance.coordsChar({
            left: coords.x,
            top: coords.y
        });
        
        // This is the only way to reorder codemirror editor events. Kill me.
        // Yes, this needs to be here twice.
        // codemirrorInstance.off('beforeChange', this.dataBound);
        
        // codemirrorInstance.on('beforeChange', this.validBound);
        // codemirrorInstance.on('beforeChange', this.dataBound);
        // codemirrorInstance.on('change', this.calcBound);
        codemirrorInstance.getDoc().replaceRange(code.droppedCode, charCoords);
        // codemirrorInstance.off('beforeChange', this.validBound);
        // codemirrorInstance.off('change', this.calcBound);
    }

    // Don't allow dragging onto a line that already has a box
    checkIfDragValid(cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable) {
        if (!this.lastDrop) { return; }
        let lastDrop = this.lastDrop;

        for (let index = 0; index < lastDrop.textFields.length; index++) {
            let realLine = index + change.from.line;
            let handle = cm.getDoc().getLineHandle(realLine);
            let tbData = this.props.textboxData.get(handle);
            if (tbData && tbData.length !== 0) {
                change.cancel();
                return;
            }
        }
    }

    // calculateTextboxDataChanges(
    //     cm: CodeMirror.Editor,
    //     change: CodeMirror.EditorChangeCancellable) {

    //     let textboxData = new Map<CodeMirror.LineHandle, Array<DraggableTextField>>([...this.props.textboxData]);

    //     // This whole system needs to be rewritten if we want to handle pastes.
    //     // Too bad I'm on a deadline.
    //     if (change.origin === 'paste') { change.cancel(); return; }

    //     if (change.origin === '+delete') { // Text is being removed, so we must remove textboxes accordingly
    //         for (let line = change.from.line; line <= change.to.line; line++) {
    //             let handle = cm.getDoc().getLineHandle(line);
    //             let data = textboxData.get(handle);
    //             let newData: DraggableTextField[] = [];
    //             if (!data) { continue; }

    //             // Delete textboxes that are highlighted over
    //             for (let key of Object.keys(data)) {
    //                 let box = data[key];

    //                 let selectionEndBound = change.to.ch;
    //                 // Check if this is the last line
    //                 if (line !== change.to.line) {
    //                     selectionEndBound = cm.getDoc().getLine(line).length;
    //                 }

    //                 if ((box.startChar >= change.from.ch && box.endChar <= selectionEndBound) ||
    //                     (box.startChar >= change.from.ch && box.startChar <= selectionEndBound) ||
    //                     (box.endChar >= change.from.ch && box.endChar <= selectionEndBound)) {
    //                     continue;
    //                 }
    //                 // Create a new copy so we don't fuck up any existing instances
    //                 newData.push(Object.assign({}, data[key])); 
    //             }

    //             // Move textboxes that have text deleted before or after
    //             // No need to check if before or after because some of the boxes have already been deleted
    //             if (line === change.from.line) {
    //                 for (let key of Object.keys(newData)) {
    //                     let numDel = change.to.ch - change.from.ch;
                        
    //                     if (change.from.ch <= newData[key].startChar) {
    //                         newData[key].startChar -= numDel;
    //                         newData[key].endChar -= numDel;
    //                     }
    //                 }
    //             } else if (line === change.to.line) {
    //                 for (let key of Object.keys(newData)) {
    //                     // Since this is the last line, the selection starts from the beginning
    //                     let numDel = change.to.ch; 

    //                     if (change.to.ch <= newData[key].startChar) {
    //                         newData[key].startChar -= numDel;
    //                         newData[key].endChar -= numDel;
    //                     }
    //                 }
    //             }
                
    //             this.dirtyLines.push(handle);
    //             if (newData.length === 0) { 
    //                 textboxData.delete(handle);
    //             } else {
    //                 textboxData.set(handle, newData);
    //             }
                
    //         }
    //     } else {
    //         for (let line = change.from.line; line <= change.to.line; line++) {
    //             let handle = cm.getDoc().getLineHandle(line);
    //             let data = textboxData.get(handle);

    //             if (this.lastDrop) {
    //                 if (!textboxData.has(handle)) {
    //                     textboxData.set(handle, []);
    //                 }
    //                 textboxData.set(handle, textboxData.get(handle)!.concat(this.lastDrop.textFields));
    //                 this.dirtyLines.push(handle);
    //             } else {
    //                 if (!data) { continue; }
    //                 // This branch means that something was only typed, and not dropped.
    //                 if (line === change.from.line) {
    //                     for (let key of Object.keys(data)) {
    //                         if (change.to.ch <= data[key].endChar && change.text.length === 1) {
    //                             let text = String(change.text[0]);
    //                             text.replace('\t', '    ');
    //                             let numAdd = text.length;

    //                             data[key] = Object.assign({}, data[key]);
    //                             data[key].startChar += numAdd;
    //                             data[key].endChar += numAdd;
    //                         }
    //                     }
    //                 }
    //                 this.dirtyLines.push(handle);
    //             }
    //         }
    //     }
    //     this.props.setTextboxData(textboxData);
    //     cm.on('change', this.calcBound);
    // }

    // calculateTextboxRenderChanges(
    //     cm: CodeMirror.Editor, 
    //     change: CodeMirror.EditorChangeLinkedList | CodeMirror.EditorChangeCancellable) {
    
    //     // For rendering
    //     let tbChanges = new Map<CodeMirror.LineHandle, Array<TextBoxProps>>([...this.props.textboxProps]); 

    //     // let dirtyFields: DraggableTextField[] = [];
    //     // for (let line of this.dirtyLines) {
    //     //     let handle = cm.getDoc().getLineHandle(line)
    //     //     dirtyFields = dirtyFields.concat(this.props.textboxData.get(handle)!);
    //     // }
    //     for (let handle of this.dirtyLines) {
    //         let dirtyFields = this.props.textboxData.get(handle)!;
            
    //         tbChanges.set(handle, []);
            
    //         if (!dirtyFields) { continue; }

    //         for (let index = 0; index < dirtyFields.length; index++) {
    //             if (!dirtyFields[index]) { continue; }
    //             let field: DraggableTextField = dirtyFields[index];
    //             let realLine = cm.getDoc().getLineNumber(handle)!;

    //             // if (!tbChanges.has(handle)) {
    //             //     tbChanges.set(handle, []);
    //             // }
    
    //             // Set up rendering props
    //             let absStartChar = field.startChar;
    //             let absEndChar = field.endChar;
    //             if (this.lastDrop) {
    //                 // Textbox was just dropped, so we must account for existing characters
    //                 absStartChar = change.from.ch + field.startChar;
    //                 absEndChar = change.from.ch + field.endChar;
                    
    //                 dirtyFields[index].startChar += change.from.ch;
    //                 dirtyFields[index].endChar += change.from.ch;
    //             }
                
    //             let firstCharPos: CodeMirror.Position = { line: realLine, ch: absStartChar };
    //             let firstCharCoords: CoordsType = cm.charCoords(firstCharPos, 'local');
    //             let lastCharPos: CodeMirror.Position = { line: realLine, ch: absEndChar };
    //             let lastCharCoords: CoordsType = cm.charCoords(lastCharPos, 'local');
    
    //             let width = lastCharCoords.right - firstCharCoords.left;
    //             let height = lastCharCoords.bottom - lastCharCoords.top - 1;
    
    //             let dimensions: TextBoxDimensions = {
    //                 x: firstCharCoords.left,
    //                 y: firstCharCoords.top,
    //                 width: width,
    //                 height: height
    //             };
    
    //             let renderObject = {
    //                 absDimensions: dimensions,
    //                 placeholderText: field.placeholderText,
    //                 onChange: (text: string) => {
    //                     field.currentText = text;
    //                 }
    //             };
                
    //             tbChanges.get(handle)!.push(renderObject);
                
    //         }
    //     }
        
    //     // for (let line of this.dirtyLines) {
    //     //     // let num = cm.getDoc().getLineNumber(line)!;
    //     //     if (!tbChanges[num]) {
    //     //         tbChanges[num] = null;
    //     //     }
    //     // }
    //     this.dirtyLines = [];

    //     cm.off('change', this.calcBound);
    //     this.props.setTextboxChanges(tbChanges);
    //     this.lastDrop = undefined;
    // }
}

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
        setTextboxData: ( data: Map<CodeMirror.LineHandle, Array<DraggableTextField>>) => {
            dispatch(Actions.setTextboxData(data));
        },
        // setTextboxChanges: (changes: Map<CodeMirror.LineHandle, Array<TextBoxProps>>) => {
        //     dispatch(Actions.setTextboxes(changes));
        // },
        setCodeMirror: (cm: CodeMirror.Editor) => {
            dispatch(Actions.codeMirrorInit(cm));
        }
    };
};

const mapStateToProps = (state: ApplicationState) => {
    return {
        // textboxProps: state.codeEditor.textBoxes,
        textboxData: state.codeEditor.textboxData
    };
};

const UnconnectedCodeEditor: DndComponentClass<CodeEditorProps> = 
    DropTarget('Draggable', dropTarget, collect)(UnwrappedCodeEditor);

const CodeEditor = connect(mapStateToProps, mapDispatchToProps)(UnconnectedCodeEditor);

export default CodeEditor;