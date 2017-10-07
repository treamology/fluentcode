import * as React from 'react';
import '../styles/small_ui.css';

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

export { PanelHeader };