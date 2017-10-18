import * as React from 'react';
import * as CodeMirror from 'react-codemirror';
import '../styles/editor.scss';
import 'codemirror/lib/codemirror.css';

class CodeEditor extends React.Component {
    render() {
        return (
            <div className="editor_container">
                <CodeMirror className="editor" value="hue" />
            </div>
        );
    }
}

export default CodeEditor;