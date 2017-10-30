import * as React from 'react';
import '../styles/small_ui.scss';

interface PanelHeaderProps {
    headerText: string;
}

class PanelHeader extends React.Component<PanelHeaderProps> {
    render() {
        return (
            <div className="panelHeader">
                <span className="panelHeaderText">{this.props.headerText}</span>
            </div>
        );
    }
}

class RunButton extends React.Component {
    constructor(props: Object) {
        super(props);
        
        this.click = this.click.bind(this);
    }

    render() {
        return (
            <a href="#" className="runButton" onClick={this.click}>Run</a>
        );
    }

    click() {
        console.log("hey");
    }
}

export { PanelHeader, RunButton };