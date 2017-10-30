import * as React from 'react';
import './App.scss';

import Header from './components/header';
import OutputPanel from './components/outputpanel';
import CodeEditor from './components/codeeditor';
import CurrentDraggableList from './containers/currentdraggablelist';
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
