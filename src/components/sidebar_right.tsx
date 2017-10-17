import * as React from 'react';
import '../App.scss';

import { PanelHeader } from './small_ui';

class SidebarRight extends React.Component {
    render() {
        return (
            <div className="sidebarRight">
                <PanelHeader headerText="Code Blocks" />
            </div>
        );
    }
}

export default SidebarRight;