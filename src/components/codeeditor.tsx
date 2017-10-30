import * as React from 'react';
import * as CodeMirror from 'react-codemirror';
import '../styles/editor.scss';
import 'codemirror/mode/python/python';

import { RunButton } from './smallui';

class CodeEditor extends React.Component {
    render() {
        return (
            <div className="editor_container">
                <CodeMirror
                    className="editor"
                    value="hue"
                    options={{
                        mode: 'python',
                        lineNumbers: true,
                    }}
                />
                <div className="runBar" />
                <RunButton />
            </div>
        );
    }
}

export default CodeEditor;