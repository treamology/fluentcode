import * as React from 'react';
import TreeView from '../react-treeview';
import { Actions } from '../state/actions';
import { ApplicationState } from '../state/types/state';
import { Course, Section } from '../models';
import { connect } from 'react-redux';
import { Dispatch, AnyAction } from 'redux';
import Store from '../store';

import '../styles/react-treeview.css';
import '../styles/courseoutline.scss';

let arrowImage = require('../assets/svg/arrow.svg');

interface CourseOutlineProps {
    currentCourse: Course;
    currentSection: Section;
    setSection: (section: Section) => AnyAction;
}

interface CourseOutlineState {
    collapsedList: boolean[];
}

class UnconnectedCourseOutline extends React.Component<CourseOutlineProps, CourseOutlineState> {

    constructor(props: CourseOutlineProps) {
        super(props);

        this.state = {
            collapsedList: []
        };

        Store.getInstance().subscribe(() => {
            let prevCourse = this.props.currentCourse;
            let currentCourse = Store.getInstance().getState().learning.currentCourse;
            if (currentCourse && prevCourse !== currentCourse) {
                this.setState({
                    collapsedList: currentCourse.lessons.map(() => true)
                });
            }

            let prevSection = this.props.currentSection;
            let currentSection = Store.getInstance().getState().learning.currentSection;
            if (currentCourse && currentSection && prevSection !== currentSection) {
                this.setState({
                    collapsedList: currentCourse.lessons.map((lesson) => {
                        if (currentSection) {
                            return lesson.number !== currentSection.lessonNumber;
                        }
                        return true;
                    })
                });
            }
        });
    }
    
    lessonClicked(index: number) {
        let [...collapsedList] = this.state.collapsedList;
        collapsedList[index] = !collapsedList[index];
        this.setState({collapsedList: collapsedList});
    }
    render() {
        let trees: JSX.Element[] = [];
        if (this.props.currentCourse && this.props.currentCourse.lessons) {
            let lessonChildren: JSX.Element[][] = [];
            for (let h = 0; h < this.props.currentCourse.lessons.length; h++) {
            // for (let h = this.props.currentCourse.lessons.length - 1; h >= 0; --h) {
                let lesson = this.props.currentCourse.lessons[h];
                let childrenArray: JSX.Element[] = [];
                // for (let i = lesson.sections.length - 1; i >= 0; --i) {
                for (let i = 0; i < lesson.sections.length; i++) {
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
            // for (let i = this.props.currentCourse.lessons.length - 1; i >= 0; --i) {
           const collapsedList = this.state.collapsedList;
            for (let i = 0; i < this.props.currentCourse.lessons.length; i++) {
                let lesson = this.props.currentCourse.lessons[i];
                
                let tree = (
                <TreeView
                    nodeLabel={`Lesson ${lesson.number}: ${lesson.name}`}
                    arrowImage={arrowImage}
                    itemClassName="parentItem"
                    key={i}
                    collapsed={collapsedList[i]}
                    onClick={this.lessonClicked.bind(this, i)}
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
        currentCourse: state.learning.currentCourse,
        currentSection: state.learning.currentSection
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