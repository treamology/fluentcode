import * as React from 'react';
import * as ReactDOM from 'react-dom';
import '../styles/editor.scss';
import 'codemirror/mode/python/python';
import { Actions } from '../state/actions';
import * as ReactCodeMirror from 'react-codemirror';
import { connect, Dispatch } from 'react-redux';
import { AnyAction } from 'redux';
import { CodeEditorState, ApplicationState } from '../state/types';
import { DroppedCodeItem } from './draggable';
import { DropTarget, DropTargetMonitor, DropTargetConnector, DndComponentClass } from 'react-dnd';
import TextBoxWidget, { TextBoxProps, TextBoxDimensions } from './widgets/textbox';

// For some reason CodeMirror doesn't provide this.
interface CoordsType { left: number; right: number; top: number; bottom: number; };

interface CodeEditorProps {
    updateCodeState: (newCode: string) => AnyAction;
    beforeChangeEvent: (cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable) => AnyAction;
    textboxProps: {};
}
interface CodeEditorPropsCollected extends CodeEditorProps {
    connectDropTarget: Function;
    isOver: boolean;
}

interface EditorOverlayProps {
    textBoxWidgets: Array<JSX.Element>;
}

const dropTarget = {
    drop(props: CodeEditorProps, monitor: DropTargetMonitor, component: UnwrappedCodeEditor) {
        let item: DroppedCodeItem = monitor.getItem() as DroppedCodeItem;
        component.dropCode(item.droppedCode, monitor.getClientOffset());
    }
};

function collect(dropConnect: DropTargetConnector, monitor: DropTargetMonitor) {
    return {
        connectDropTarget: dropConnect.dropTarget(),
        isOver: monitor.isOver()
    };
}

class EditorOverlay extends React.Component<EditorOverlayProps, {}> {
    render() {
        return <div>
        {
            this.props.textBoxWidgets.map((widget) =>
                widget
            )
        }
        </div>;
    }
}

class UnwrappedCodeEditor extends React.Component<CodeEditorPropsCollected, {}> {
    static TAB_SIZE = 4;
    static TAB_REPLACEMENT = Array(UnwrappedCodeEditor.TAB_SIZE + 1).join(" ");
    static MAGIC_CHARACTER = "\\\\";
    
    codeMirrorInstance: CodeMirror.Editor;
    editor: ReactCodeMirror.ReactCodeMirror;

    tbContainerDiv: HTMLDivElement;
    currentTbWidgets: Array<JSX.Element>;

    constructor(props: CodeEditorPropsCollected) {
        super(props);

        this.tbContainerDiv = document.createElement('div');
        this.tbContainerDiv.id = "reactContainerDiv";
    }

    render() {
        // let textBoxWidgets: Array<JSX.Element> = [];
        this.currentTbWidgets = [];
        for (let line in this.props.textboxProps) {
            let list: Array<TextBoxProps> = this.props.textboxProps[line];
            // if (!props) {
            //     continue
            // };
            for (let tbIndex in list) {
                let props = list[tbIndex];
                this.currentTbWidgets.push(
                    <TextBoxWidget absDimensions={props.absDimensions} key={Number(line + tbIndex)} />
                );
            }
        }
        // let blah = <EditorOverlay textBoxWidgets={textBoxWidgets} />;
        // console.log(blah);
        // console.log(ReactDOM);
        
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
                            "Tab": (cm: CodeMirror.Editor) => {
                                cm.getDoc().replaceSelection(UnwrappedCodeEditor.TAB_REPLACEMENT, "end");
                            }
                        }
                    }}
                >
                    
                </ReactCodeMirror>
            </div>
        );
    }

    componentDidUpdate() {
        ReactDOM.render(<EditorOverlay textBoxWidgets={this.currentTbWidgets}/>, this.tbContainerDiv);
    }

    componentDidMount() {
        let cm = this.editor.getCodeMirror()
        cm.on("change", this.props.beforeChangeEvent);

        cm.addWidget({line: 0, ch: 0}, this.tbContainerDiv, false);
        this.tbContainerDiv.style.top = '0px';
        this.tbContainerDiv.style.left = '0px';
    }

    // tslint:disable-next-line
    dropCode(code: string, coords: any) {
        let codemirrorTags: ReactCodeMirror.ReactCodeMirror = this.editor;
        let codemirrorInstance: CodeMirror.Editor = codemirrorTags.getCodeMirror();

        let charCoords = codemirrorInstance.coordsChar({
            left: coords.x,
            top: coords.y
        });
        codemirrorInstance.getDoc().replaceRange(code, charCoords);
    }
}

function calculateTextboxChanges(cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable, dispatch: Dispatch<CodeEditorState>) {
    if (change.origin === "+input") return;
    console.log(change);

    const mc = UnwrappedCodeEditor.MAGIC_CHARACTER;
    const re = new RegExp(mc + '.*?' + mc, "g");

    let tbChanges = {};

    //let startLine = change.from.line;
    //let startChar = change.from.ch;
    for (let relLineNum in change.text) {
        let text = change.text[relLineNum];
        let absLine = change.from.line + Number(relLineNum);

        let lineChanges: Array<TextBoxProps> = [];

        // exec() only finds one thing at a time, so we have to loop through
        let foundExp;
        while ((foundExp = re.exec(text)) !== null) {
            let absChar = change.from.ch + foundExp.index;
            //console.log(foundExp);
            let firstCharPos: CodeMirror.Position = { line: absLine, ch: absChar };
            let firstCharCoords: CoordsType = cm.charCoords(firstCharPos, "local");
            let lastCharPos: CodeMirror.Position = { line: absLine, ch: absChar + (foundExp[0].length - 1) };
            let lastCharCoords: CoordsType = cm.charCoords(lastCharPos, "local");

            let width = lastCharCoords.right - firstCharCoords.left;
            let height = lastCharCoords.bottom - lastCharCoords.top;

            let dimensions: TextBoxDimensions = {
                x: firstCharCoords.left,
                y: firstCharCoords.top,
                width: width,
                height: height
            }

            lineChanges.push({ absDimensions: dimensions })
        }

        // There are no textboxes, so set it to undefined so it gets removed from the state
        if (lineChanges.length == 0) {
            tbChanges[absLine] = null;
            continue;
        }
        tbChanges[absLine] = lineChanges;
    }

    return dispatch(Actions.setTextboxes(tbChanges));
}

const mapDispatchToProps = (dispatch: Dispatch<CodeEditorState>) => {
    return {
        updateCodeState: (newCode: string) => {
            dispatch(Actions.setCode(newCode));
        },
        beforeChangeEvent: (cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable) => {
            calculateTextboxChanges(cm, change, dispatch);
        }
    };
};

const mapStateToProps = (state: ApplicationState) => {
    return {
        textboxProps: state.codeEditor.textBoxes
    }
}

const UnconnectedCodeEditor: DndComponentClass<CodeEditorProps> = 
    DropTarget('Draggable', dropTarget, collect)(UnwrappedCodeEditor);

const CodeEditor = connect(mapStateToProps, mapDispatchToProps)(UnconnectedCodeEditor);

export default CodeEditor;