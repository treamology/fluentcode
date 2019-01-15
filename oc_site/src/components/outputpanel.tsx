import * as React from 'react';
import '../App.scss';
import { ApplicationState } from '../state/types/state';
import { connect } from 'react-redux';

import { PanelHeader } from './smallui';

interface OutputPanelProps {
    output: string;
    exception: string;
}

class UnconnectedOutputPanel extends React.Component<OutputPanelProps> {
    render() {
        // TODO: print both the output and the exception
        let output = this.props.output;
        if (this.props.exception !== undefined && this.props.exception !== '') {
            output = this.props.exception;
        }

        return (
            <div className="outputPanel">
                <PanelHeader headerText="Output" />
                <textarea className="outputArea" spellCheck={false} value={output} />
            </div>
        );
    }
}

const mapStateToProps = (state: ApplicationState) => {
    return {
        output: state.codeExecution.lastOutput,
        exception: state.codeExecution.lastException
    };
};

const OutputPanel = connect(mapStateToProps)(UnconnectedOutputPanel);

export default OutputPanel;