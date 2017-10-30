import * as React from 'react';
import './App.scss';

import Header from './components/header';
import OutputPanel from './components/output_panel';
import CodeEditor from './components/code_editor';
import CurrentDraggableList from './containers/current_draggable_list';
import { PanelHeader } from './components/small_ui';

class OCSite extends React.Component {
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
          <CurrentDraggableList />
        </div>
        <OutputPanel />
      </div>
    );
  }
}

export default OCSite;
