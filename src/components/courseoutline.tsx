import * as React from 'react';
import TreeView from '../react-treeview';
import { Actions } from '../state/actions';
import { ApplicationState } from '../state/types/state';
import { Course, Section } from '../models';
import { connect } from 'react-redux';
import { Dispatch, AnyAction } from 'redux';

import '../styles/react-treeview.css';
import '../styles/courseoutline.scss';

let arrowImage = require('../assets/svg/arrow.svg');

interface CourseOutlineProps {
    currentCourse: Course;
    setSection: (section: Section) => AnyAction;
}

class UnconnectedCourseOutline extends React.Component<CourseOutlineProps> {
    render() {
        let trees: JSX.Element[] = [];
        if (this.props.currentCourse && this.props.currentCourse.lessons) {
            
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
                        onClick={() => this.props.setSection(section)}
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
}

const mapStateToProps = (state: ApplicationState) => {
    return {
        currentCourse: state.learning.currentCourse
    };
};

const mapDispatchToProps = (dispatch: Dispatch<ApplicationState>) => {
    return {
        setSection: (section: Section) => {
            dispatch(Actions.selectSection(section));
        }
    };
};

const CourseOutline = connect(mapStateToProps, mapDispatchToProps)(UnconnectedCourseOutline);

export default CourseOutline;