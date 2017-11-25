import * as React from 'react';
import './App.scss';

import Header from './components/header';
import OutputPanel from './components/outputpanel';
import CodeEditor from './components/codeeditor';
import CurrentDraggableList from './containers/currentdraggablelist';
import RunBar from './components/runbar';
import { PanelHeader } from './components/smallui';
import HTML5Backend from 'react-dnd-html5-backend';
import { DragDropContext } from 'react-dnd';
import Store from './store';
import { AsyncActions } from './state/actions';

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
            <RunBar />
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

  componentWillMount() {
    Store.getInstance().dispatch(AsyncActions.getAPIKey());
  }
}

export default DragDropContext(HTML5Backend)(OCSite);
