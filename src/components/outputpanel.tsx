import * as React from 'react';
import '../App.scss';
import { ApplicationState } from '../state/types';
import { connect } from 'react-redux';

import { PanelHeader } from './smallui';

interface OutputPanelProps {
    output: string;
}

class UnconnectedOutputPanel extends React.Component<OutputPanelProps> {
    render() {
        return (
            <div className="outputPanel">
                <PanelHeader headerText="Output" />
                <textarea className="outputArea" spellCheck={false} value={this.props.output} />
            </div>
        );
    }
}

const mapStateToProps = (state: ApplicationState) => {
    return {
        output: state.codeExecution.lastOutput
    };
};

const OutputPanel = connect(mapStateToProps)(UnconnectedOutputPanel);

export default OutputPanel;