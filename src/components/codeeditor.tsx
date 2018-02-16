import * as React from 'react';
import * as ReactDOM from 'react-dom';

import '../styles/editor.scss';
import 'codemirror/mode/python/python';
import { UnconnectedWidgetContainer, WidgetContainer } from './widgets/components';
import { TextOperation } from './widgets/util';
import { Actions } from '../state/actions';
import * as ReactCodeMirror from 'react-codemirror';
import { connect, Dispatch, Provider } from 'react-redux';
import { AnyAction } from 'redux';
import { CodeEditorState, ApplicationState } from '../state/types/state';
import { DroppedCodeItem } from './draggable';
import { DropTarget, DropTargetMonitor, DropTargetConnector, DndComponentClass } from 'react-dnd';
import Store from '../store';

// For some reason CodeMirror doesn't provide this.
// interface CoordsType { left: number; right: number; top: number; bottom: number; }

interface CodeEditorProps {
    updateCodeState: (newCode: string) => AnyAction;
    setCodeMirror: (cm: CodeMirror.Editor) => AnyAction;
}

// Extra props from the drag/drop library.
interface CodeEditorPropsCollected extends CodeEditorProps {
    connectDropTarget: Function;
    isOver: boolean;
}

class UnwrappedCodeEditor extends React.Component<CodeEditorPropsCollected> {
    static TAB_SIZE = 4;
    static TAB_REPLACEMENT = Array(UnwrappedCodeEditor.TAB_SIZE + 1).join(' '); // replace tab characters with 4 spaces
    static MAGIC_CHARACTER = '\\\\';
    
    editor: ReactCodeMirror.ReactCodeMirror;
    widgetContainer: UnconnectedWidgetContainer;
    // Since CodeMirror isn't using React, we need to have a div to render into (the div gets turned
    // into a CodeMirror widget)
    tbContainerDiv: HTMLDivElement;

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
    }

    render() {
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
            let removed = '';
            if (changeObj.removed) {
                removed = changeObj.removed.join('\n');
            }
            if (changeObj.origin === "+delete") {
                operation = TextOperation.delete;
            }
            if (!this.widgetContainer) {
                return true;
            }
            return this.widgetContainer.checkChange(operation, changeObj.text.join('\n'), changeObj.from, changeObj.to, this.lastDrop, removed);
        });
        cm.on('change', (instance, changeObj) => {
            let operation: TextOperation = TextOperation.insert;
            let removed = '';
            if (changeObj.removed) {
                removed = changeObj.removed.join('\n');
            }
            if (changeObj.origin === "+delete") {
                operation = TextOperation.delete;
            }

            if (this.widgetContainer) {
                this.widgetContainer.textChanged(operation, changeObj.text.join('\n'), changeObj.from, changeObj.to, this.lastDrop, removed);
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
        
        codemirrorInstance.getDoc().replaceRange(code.droppedCode, charCoords);
    }

    // Don't allow dragging onto a line that already has a box
    checkIfDragValid(cm: CodeMirror.Editor, change: CodeMirror.EditorChangeCancellable) {
        // TODO: reimplement this

        // if (!this.lastDrop) { return; }
        // let lastDrop = this.lastDrop;

        // for (let index = 0; index < lastDrop.textFields.length; index++) {
        //     let realLine = index + change.from.line;
        //     let handle = cm.getDoc().getLineHandle(realLine);
        //     let tbData = this.props.textboxData.get(handle);
        //     if (tbData && tbData.length !== 0) {
        //         change.cancel();
        //         return;
        //     }
        // }
    }
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
        setCodeMirror: (cm: CodeMirror.Editor) => {
            dispatch(Actions.codeMirrorInit(cm));
        }
    };
};

const mapStateToProps = (state: ApplicationState) => {
    return {};
};

const UnconnectedCodeEditor: DndComponentClass<CodeEditorProps> = 
    DropTarget('Draggable', dropTarget, collect)(UnwrappedCodeEditor);

const CodeEditor = connect(mapStateToProps, mapDispatchToProps)(UnconnectedCodeEditor);

export default CodeEditor;