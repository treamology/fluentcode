import * as React from 'react';
import '../App.scss';

import { PanelHeader } from './small_ui';
import Draggable from './draggable';

class SidebarRight extends React.Component {
    render() {
        return (
            <div className="sidebarRight">
                <PanelHeader headerText="Code Blocks" />
                <Draggable codeTitleText="if" nonCodeTitleText="statement" descriptionText="Something about an if statement."/>
            </div>
        );
    }
}

export default SidebarRight;