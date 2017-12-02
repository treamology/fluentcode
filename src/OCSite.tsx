import * as React from 'react';
import './App.scss';
import { connect } from 'react-redux';

import Header from './components/header';
import OutputPanel from './components/outputpanel';
import CodeEditor from './components/codeeditor';
import CurrentDraggableList from './containers/currentdraggablelist';
import RunBar from './components/runbar';
import CourseOutline from './components/courseoutline';
import { PanelHeader } from './components/smallui';
import HTML5Backend from 'react-dnd-html5-backend';
import { DragDropContext } from 'react-dnd';
import Store from './store';
import { AsyncActions } from './state/actions';
import { ApplicationState } from './state/types';

interface OCSiteProps {
  serverError: boolean;
}

class UnconnectedOCSite extends React.Component<OCSiteProps> {
  render() {
    if (Store.getInstance().getState().serverError) {
      return (
        <div style={{ backgroundColor: 'white', width: '100vw', height: '100vh' }}>
          <span>There was an issue communicating with the server. </span>
          <a href=".">Reload the page?</a>
        </div>
      );
    }
    return (
      <div className="appContainer">
        <Header />
        <div className="appContent">
          <div className="sidebarLeft">
              <div className="courseOutlineSection">
                  <PanelHeader headerText="Course Outline" />
                  <CourseOutline />
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

const mapStateToProps = (state: ApplicationState) => {
  return {
      serverError: state.serverError
  };
};

const OCSite = connect(mapStateToProps)(DragDropContext(HTML5Backend)(UnconnectedOCSite));

export default OCSite;
