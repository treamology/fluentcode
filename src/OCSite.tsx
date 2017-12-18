import * as React from 'react';
import './App.scss';
import { connect } from 'react-redux';

import Header from './components/header';
import OutputPanel from './components/outputpanel';
import CodeEditor from './components/codeeditor';
import DraggableList from './components/draggablelist';
import RunBar from './components/runbar';
import CourseOutline from './components/courseoutline';
import CurrentSection from './components/currentsection';
import { PanelHeader } from './components/smallui';
import HTML5Backend from 'react-dnd-html5-backend';
import { DragDropContext } from 'react-dnd';
import Store from './store';
import { AsyncActions } from './state/actions';
import { ApplicationState } from './state/types/state';

interface OCSiteProps {
  serverError: boolean;
  checkingConnection: boolean;
}

class UnconnectedOCSite extends React.Component<OCSiteProps> {
  render() {
    if (this.props.serverError) {
      return (
        <div style={{ backgroundColor: 'white', width: '100vw', height: '100vh' }}>
          <span>There was an issue communicating with the server. </span>
          <a href=".">Reload the page?</a>
        </div>
      );
    }
    let connectionCheck;
    if (this.props.checkingConnection) {
      connectionCheck = (
        <div className="connectionCheckContainer">
          <div className="connectionCheck">
            <span className="uhoh">!</span>
            <span className="connectionMessage">We're having trouble connecting to the server. Still trying...</span>
          </div>
        </div>
      );
    }
    return (
      <div className="appContainer">
        {connectionCheck}
        <Header />
        <div className="appContent">
          <div className="sidebarLeft">
              <PanelHeader headerText="Course Outline" />
              <CourseOutline />
              <PanelHeader headerText="Current Section" />
              <CurrentSection />
          </div>
          <div className="centerContent">
            <CodeEditor />
            <RunBar />
            <OutputPanel />
          </div>
          <div className="sidebarRight">
            <PanelHeader headerText="Code Blocks" />
            <DraggableList />
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
      serverError: state.serverError,
      checkingConnection: state.checkingConnection
  };
};

const OCSite = connect(mapStateToProps)(DragDropContext(HTML5Backend)(UnconnectedOCSite));

export default OCSite;
