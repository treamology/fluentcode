import * as React from 'react';
import TreeView from '../react-treeview';
import Store from '../store';
import { AsyncActions } from '../state/actions';
import { ApplicationState } from '../state/types/state';
import { Course } from '../models';
import { connect } from 'react-redux';

import '../styles/react-treeview.css';
import '../styles/courseoutline.scss';

let arrowImage = require('../assets/svg/arrow.svg');

interface CourseOutlineProps {
    currentCourse: Course;
}

class UnconnectedCourseOutline extends React.Component<CourseOutlineProps> {
    render() {
        let trees: JSX.Element[] = [];
        if (this.props.currentCourse) {
            
            let lessonChildren: JSX.Element[][] = [];
            for (let h = 0; h < this.props.currentCourse.lessons.length; h++) {
                let lesson = this.props.currentCourse.lessons[h];
                let childrenArray: JSX.Element[] = [];
                for (let i = lesson.sections.length - 1; i >= 0; --i) {
                    let section = lesson.sections[i];
                    let tree = (
                    <TreeView
                        nodeLabel={`Section ${section.number}: ${section.name}`}
                        arrowImage={arrowImage}
                        key={lesson.number.toString() + section.number}
                    />
                    );

                    childrenArray.push(tree);
                }

                lessonChildren.push(childrenArray);
            }

            // for (let lesson of this.props.currentCourse.lessons) {
            for (let i = this.props.currentCourse.lessons.length - 1; i >= 0; --i) {
                let lesson = this.props.currentCourse.lessons[i];
                let tree = (
                <TreeView
                    nodeLabel={`Lesson ${lesson.number}: ${lesson.name}`}
                    arrowImage={arrowImage}
                    itemClassName="parentItem"
                    key={lesson.number}
                >
                    {lessonChildren[i].map((child) => child)}
                </TreeView>);
                trees.push(tree);
            }
        }

        return (
        <div className="courseOutlineContainer">
            {trees.map((tree) => tree)}
        </div>
        );
    }
    
    // temporary
    componentWillMount() {
        Store.getInstance().dispatch(AsyncActions.getCourseDetail(1));
    }
}

const mapStateToProps = (state: ApplicationState) => {
    return {
        currentCourse: state.learning.currentCourse
    };
};

const CourseOutline = connect(mapStateToProps)(UnconnectedCourseOutline);

export default CourseOutline;