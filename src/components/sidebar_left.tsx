import * as React from 'react';
import '../App.css';

import { PanelHeader } from './small_ui';

class SidebarLeft extends React.Component {
    render() {
        return (
            <div className="sidebarLeft">
                <PanelHeader />
            </div>
        );
    }
}

export default SidebarLeft;