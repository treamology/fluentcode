import * as React from 'react';
import './App.scss';

import Header from './components/header';
import OutputPanel from './components/outputpanel';
import CodeEditor from './components/codeeditor';
import CurrentDraggableList from './containers/currentdraggablelist';
import { PanelHeader } from './components/smallui';
import HTML5Backend from 'react-dnd-html5-backend';
import { DragDropContext } from 'react-dnd';

class OCSite extends React.Component {
  render() {
    return (
      <div className="appContainer">
        <Header />
        <div className="appContent">
          <div className="sidebarLeft">
              <div className="courseOutlineSection">
                  <PanelHeader headerText="Course Outline" />
              </div>
              <div className="lessonContentSection">
                  <PanelHeader headerText="Current Lesson" />
              </div>
          </div>
          <div className="centerContent">
            <CodeEditor />
            <div className="runBar" />
            <OutputPanel />
          </div>
          <div className="sidebarRight">
            <PanelHeader headerText="Code Blocks" />
            <CurrentDraggableList />
          </div>
        </div>
        
      </div>
    );
  }
}

export default DragDropContext(HTML5Backend)(OCSite);
