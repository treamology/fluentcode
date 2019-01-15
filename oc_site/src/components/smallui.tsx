import * as React from 'react';
import '../styles/small_ui.scss';

interface PanelHeaderProps {
    headerText: string;
    onClick?: (event: {}) => void;
}

class PanelHeader extends React.Component<PanelHeaderProps> {
    render() {
        return (
            <div className="panelHeader" onClick={this.props.onClick}>
                <span className="panelHeaderText">{this.props.headerText}</span>
                {this.props.children}
            </div>
        );
    }
}

export { PanelHeader };