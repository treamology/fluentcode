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
import { Section } from './models';
import RequirementsBar from './components/requirementsbar';

let arrowImage = require('./assets/svg/arrow.svg');

interface OCSiteProps {
  serverError: boolean;
  checkingConnection: boolean;
  currentSection: Section;
}

interface OCSiteState {
  courseOutlineCollapsed: boolean;
}

class UnconnectedOCSite extends React.Component<OCSiteProps, OCSiteState> {
  constructor(props: OCSiteProps) {
    super(props);

    this.state = {
      courseOutlineCollapsed: false
    };

    this.toggleCourseOutline = this.toggleCourseOutline.bind(this);
  }

  toggleCourseOutline() {
    this.setState((prevState: OCSiteState) => {
      return { courseOutlineCollapsed: !prevState.courseOutlineCollapsed };
    });
  }
  
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
    let sectionTitle = 'Current Section';
    if (this.props.currentSection) {
      sectionTitle = 'Section ' + this.props.currentSection.number + ': ' + this.props.currentSection.name;
    }
    let arrowClassName = 'courseOutlineArrow';
    if (!this.state.courseOutlineCollapsed) {
      arrowClassName += ' collapsed';
    }
    return (
      <div className="appContainer">
        {connectionCheck}
        <span style={{position: 'absolute', bottom: 4, right: 4, color: 'white', zIndex: 1000}}>
          {process.env.REACT_APP_PROD_VERSION}
        </span>
        <Header />
        <div className="appContent">
          <div className="sidebarLeft">
              <PanelHeader headerText="Course Outline" onClick={this.toggleCourseOutline}>
                <img src={arrowImage} className={arrowClassName}/>
              </PanelHeader>
              <CourseOutline hidden={this.state.courseOutlineCollapsed}/>
              <PanelHeader headerText={sectionTitle} />
              <CurrentSection />
          </div>
          <div className="centerContent">
            <CodeEditor />
            <RunBar />
            <div className="outputStuff">
              <OutputPanel />
              <RequirementsBar />
            </div>
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
    Store.getInstance().dispatch(AsyncActions.getCourseDetail(1));
  }
}

const mapStateToProps = (state: ApplicationState) => {
  return {
      serverError: state.serverError,
      checkingConnection: state.checkingConnection,
      currentSection: state.learning.currentSection
  };
};

const OCSite = connect(mapStateToProps)(DragDropContext(HTML5Backend)(UnconnectedOCSite));

export default OCSite;
