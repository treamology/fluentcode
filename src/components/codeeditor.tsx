import * as React from 'react';
import * as CodeMirror from 'react-codemirror';
import '../styles/editor.scss';
import 'codemirror/mode/python/python';

import { DropTarget, DropTargetMonitor, DropTargetConnector, DndComponentClass } from 'react-dnd';

interface CodeEditorProps {}
interface CodeEditorPropsCollected extends CodeEditorProps {
    connectDropTarget: Function
    isOver: boolean
}
interface CodeEditorState extends React.ComponentState {
    code: string;
}

const dropTarget = {
    drop(props: CodeEditorProps, monitor: DropTargetMonitor, component: UnwrappedCodeEditor) {
        let item: any = monitor.getItem();
        component.dropCode(item.droppedCode, monitor.getClientOffset());
    }
}
function collect(connect: DropTargetConnector, monitor: DropTargetMonitor) {
    return {
        connectDropTarget: connect.dropTarget(),
        isOver: monitor.isOver()
    };
}

class UnwrappedCodeEditor extends React.Component<CodeEditorPropsCollected, CodeEditorState> {
    codeMirrorInstance: any;
    lastDragCoords: any;

    constructor() {
        super();
        this.state = {
            code: ""
        };

        this.updateCodeState = this.updateCodeState.bind(this);
    }

    render() {
        return this.props.connectDropTarget(
            <div className="editor_container">
                <CodeMirror
                    ref="editor"
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

    dropCode(code: string, coords: any) {
        let codemirrorTags: any = this.refs.editor;
        let codemirrorInstance: any = codemirrorTags.getCodeMirror();

        let charCoords = codemirrorInstance.coordsChar({
            left: coords.x,
            top: coords.y
        });
        codemirrorInstance.replaceRange(code, charCoords);
    }
}

const CodeEditor: DndComponentClass<CodeEditorProps> = DropTarget("Draggable", dropTarget, collect)(UnwrappedCodeEditor)
export default CodeEditor;
