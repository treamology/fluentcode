import * as React from 'react';
import * as TreeView from 'react-treeview';

import 'react-treeview/react-treeview.css';
import '../styles/courseoutline.scss'

interface CourseOutlineProps {

}

class CourseOutline extends React.Component<CourseOutlineProps> {
    render() {
        return(
        <div>
            <TreeView nodeLabel="hey there" defaultCollapsed={true}>
                <TreeView nodeLabel="hey there" />
            </TreeView>
        </div>);
    }
}

export default CourseOutline;