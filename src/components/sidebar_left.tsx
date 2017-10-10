import * as React from 'react';
import '../App.css';
import '../styles/sidebar_left.scss';

import { PanelHeader } from './small_ui';

class SidebarLeft extends React.Component {
    render() {
        return (
            <div className="sidebarLeft">
                <div className="courseOutlineSection">
                    <PanelHeader headerText="Course Outline" />
                </div>
                <div className="lessonContentSection">
                    <PanelHeader headerText="Current Lesson" />
                </div>
            </div>
        );
    }
}

export default SidebarLeft;