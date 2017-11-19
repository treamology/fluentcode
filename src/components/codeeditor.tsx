import * as React from 'react';
import '../styles/editor.scss';
import 'codemirror/mode/python/python';
import { Actions } from '../state/actions';
import * as ReactCodeMirror from 'react-codemirror';
import { connect, Dispatch } from 'react-redux';
import { AnyAction } from 'redux';
import { CodeEditorState } from '../state/types';
import { DroppedCodeItem } from './draggable';
import { DropTarget, DropTargetMonitor, DropTargetConnector, DndComponentClass } from 'react-dnd';

interface CodeEditorProps {
    updateCodeState: (newCode: string) => AnyAction;
}
interface CodeEditorPropsCollected extends CodeEditorProps {
    connectDropTarget: Function;
    isOver: boolean;
}
interface CodeEditorComponentState extends React.ComponentState {
    code: string;
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

class UnwrappedCodeEditor extends React.Component<CodeEditorPropsCollected, CodeEditorComponentState> {
    codeMirrorInstance: CodeMirror.Editor;
    editor: ReactCodeMirror.ReactCodeMirror;

    constructor() {
        super();
        this.state = {
            code: ''
        };
    }

    render() {
        return this.props.connectDropTarget(
            <div className="editor_container">
                <ReactCodeMirror
                    ref={(editor: ReactCodeMirror.ReactCodeMirror) => this.editor = editor}
                    className="editor"
                    value={this.state.code}
                    onChange={this.props.updateCodeState}
                    options={{
                        mode: 'python',
                        lineNumbers: true,
                    }}
                />
            </div>
        );
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

const mapDispatchToProps = (dispatch: Dispatch<CodeEditorState>) => {
    return {
        updateCodeState: (newCode: string) => {
            dispatch(Actions.setCode(newCode));
        }
    };
};

const UnconnectedCodeEditor: DndComponentClass<CodeEditorProps> = 
    DropTarget('Draggable', dropTarget, collect)(UnwrappedCodeEditor);

const CodeEditor = connect(null, mapDispatchToProps)(UnconnectedCodeEditor);

export default CodeEditor;