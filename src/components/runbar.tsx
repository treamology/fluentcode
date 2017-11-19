import * as React from 'react';
import '../App.scss';
import { connect, Dispatch } from 'react-redux';
import { CodeExecutionState } from '../state/types'

import { Actions } from '../state/actions';
//import { bindActionCreators } from 'redux';

let runTriangle = require('../assets/svg/runtriangle.svg');

interface RunBarState {
    
}

interface RunBarProps {
    runButtonClicked: () => any;
}

class UnconnectedRunBar extends React.Component<RunBarProps, RunBarState> {

    render() {
        return (
            <div className="runBar">
                <a className="runButtonContainer" onClick={this.props.runButtonClicked}>
                    <span className="runButtonText">Run</span>
                    <img className="runButtonImage" src={runTriangle} />
                </a>
            </div>
        );
    }
}

const mapDispatchToProps = (dispatch: Dispatch<CodeExecutionState>) => {
    return {
        runButtonClicked: () => {
            dispatch(Actions.runCode());
        } 
    }
}

// const mapDispatchToProps = (dispatch: Dispatch<CodeExecutionState>) => bindActionCreators({

// })

const RunBar = connect(null, mapDispatchToProps)(UnconnectedRunBar);

export default RunBar;