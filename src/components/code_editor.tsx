import * as React from 'react';
import * as CodeMirror from 'react-codemirror';
import '../styles/editor.scss';
import 'codemirror/mode/python/python';

import { RunButton } from './small_ui';

class CodeEditor extends React.Component {
    render() {
        return (
            <div className="editor_container">
                <CodeMirror
                    className="editor"
                    value="hue"
                    options={{
                        mode: 'python',
                    }}
                />
                <RunButton />
            </div>
        );
    }
}

export default CodeEditor;