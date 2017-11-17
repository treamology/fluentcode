import * as React from 'react';
import '../styles/editor.scss';
import 'codemirror/mode/python/python';

import * as ReactCodeMirror from 'react-codemirror';

import { DroppedCodeItem } from './draggable';

import { DropTarget, DropTargetMonitor, DropTargetConnector, DndComponentClass } from 'react-dnd';

interface CodeEditorProps {}
interface CodeEditorPropsCollected extends CodeEditorProps {
    connectDropTarget: Function;
    isOver: boolean;
}
interface CodeEditorState extends React.ComponentState {
    code: string;
}

const dropTarget = {
    drop(props: CodeEditorProps, monitor: DropTargetMonitor, component: UnwrappedCodeEditor) {
        let item: DroppedCodeItem = monitor.getItem() as DroppedCodeItem;
        component.dropCode(item.droppedCode, monitor.getClientOffset());
    }
};

function collect(connect: DropTargetConnector, monitor: DropTargetMonitor) {
    return {
        connectDropTarget: connect.dropTarget(),
        isOver: monitor.isOver()
    };
}

class UnwrappedCodeEditor extends React.Component<CodeEditorPropsCollected, CodeEditorState> {
    codeMirrorInstance: CodeMirror.Editor;
    editor: ReactCodeMirror.ReactCodeMirror;

    constructor() {
        super();
        this.state = {
            code: ''
        };

        this.updateCodeState = this.updateCodeState.bind(this);
    }

    render() {
        return this.props.connectDropTarget(
            <div className="editor_container">
                <ReactCodeMirror
                    ref={(editor: ReactCodeMirror.ReactCodeMirror) => this.editor = editor}
                    className="editor"
                    value={this.state.code}
                    onChange={this.updateCodeState}
                    options={{
                        mode: 'python',
                        lineNumbers: true,
                    }}
                />
            </div>
        );
    }

    updateCodeState(newCode: string) {
        this.setState({
            code: newCode
        });
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

const CodeEditor: DndComponentClass<CodeEditorProps> = 
    DropTarget('Draggable', dropTarget, collect)(UnwrappedCodeEditor);

export default CodeEditor;