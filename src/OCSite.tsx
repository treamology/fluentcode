import * as React from 'react';
import './App.scss';

import Header from './components/header';
import OutputPanel from './components/output_panel';
import CodeEditor from './components/code_editor';
import { PanelHeader } from './components/small_ui';

//import { CodeBlock } from './state/types';

interface OCSiteProps {
  // currentDraggables: Array<CodeBlock>;
}

class OCSite extends React.Component<OCSiteProps> {
  render() {
    return (
      <div className="gridContainer">
        <Header />
        <CodeEditor />
        <div className="sidebarLeft">
            <div className="courseOutlineSection">
                <PanelHeader headerText="Course Outline" />
            </div>
            <div className="lessonContentSection">
                <PanelHeader headerText="Current Lesson" />
            </div>
        </div>
        <div className="sidebarRight">
          <PanelHeader headerText="Code Blocks" />
        </div>
        <OutputPanel />
      </div>
    );
  }
}

export default OCSite;
