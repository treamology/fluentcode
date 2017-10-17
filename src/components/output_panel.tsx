import * as React from 'react';
import '../App.scss';

import { PanelHeader } from './small_ui';

class OutputPanel extends React.Component {
    render() {
        return (
            <div className="outputPanel">
                <PanelHeader headerText="Output" />
            </div>
        );
    }
}

export default OutputPanel;