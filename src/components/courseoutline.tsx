import * as React from 'react';
import * as TreeView from 'react-treeview';

import 'react-treeview/react-treeview.css';
import '../styles/courseoutline.scss'

let arrowImage = require('../assets/svg/arrow.svg');

interface CourseOutlineProps {

}

class CourseOutline extends React.Component<CourseOutlineProps> {
    render() {
        return(
        <div className="courseOutlineContainer">
            <TreeView nodeLabel="Lesson 1: Blah Blah" defaultCollapsed={true} arrowImage={arrowImage} itemClassName="parentItem">
                <TreeView nodeLabel="Section 1.1: Blah Blah" />
                <TreeView nodeLabel="Section 1.1: Blah Blah" />
            </TreeView>
            <TreeView nodeLabel="Lesson 2: Blah Blah" defaultCollapsed={true} arrowImage={arrowImage} itemClassName="parentItem">
                <TreeView nodeLabel="Section 2.1: Blah Blah" />
            </TreeView>
        </div>);
    }
}

export default CourseOutline;