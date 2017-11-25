import * as React from 'react';
import '../styles/runbar.scss';
import { connect, Dispatch } from 'react-redux';
import { CodeExecutionState, ExecutionState, ApplicationState } from '../state/types';

import { AsyncActions } from '../state/actions';
import { AnyAction } from 'redux';

let runTriangle = require('../assets/svg/runtriangle.svg');

interface RunBarProps {
    executionState: ExecutionState;
    runButtonClicked: () => AnyAction;
}

class UnconnectedRunBar extends React.Component<RunBarProps> {
    render() {
        switch (this.props.executionState) {
            case ExecutionState.running:
                return (
                    <div className="runBar running">
                        <span className="runningText">Running...</span>
                    </div>
                );
            case ExecutionState.failed:
                return (
                    <div className="runBar error">
                        <span className="errorText">Something went wrong!</span>
                    </div>
                );
            case ExecutionState.success:
                return (
                    <div className="runBar success">
                        <span className="successText">Success!</span>
                    </div>
                );
            default:
                return (
                    <div className="runBar idle">
                        <a className="runButtonContainer" onClick={this.props.runButtonClicked}>
                            <span className="runButtonText">Run</span>
                            <img className="runButtonImage" src={runTriangle} />
                        </a>
                    </div>
                );
        }
    }
}

const mapStateToProps = (state: ApplicationState) => {
    return {
        executionState: state.codeExecution.state
    };
};

const mapDispatchToProps = (dispatch: Dispatch<CodeExecutionState>) => {
    return {
        runButtonClicked: () => {
            dispatch(AsyncActions.runCode());
        }
    };
};

const RunBar = connect(mapStateToProps, mapDispatchToProps)(UnconnectedRunBar);

export default RunBar;