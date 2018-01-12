import * as React from 'react';
import TreeView from '../react-treeview';
import { Actions } from '../state/actions';
import { ApplicationState } from '../state/types/state';
import { Course, Section } from '../models';
import { connect } from 'react-redux';
import { Dispatch, AnyAction } from 'redux';
import Store from '../store';
import { withRouter, match } from 'react-router';
import { Location, History, Action } from 'history';

import '../styles/react-treeview.css';
import '../styles/courseoutline.scss';

interface ParsedPath {
    courseID: number;
    lessonNum: number;
    sectionNum: number;
}

let arrowImage = require('../assets/svg/arrow.svg');

function createRouterPath(courseID: number, lessonNum: number, sectionNum: number): string {
    let path = '/';

    path += 'course-' + courseID + '/';
    path += 'lesson-' + lessonNum + '/';
    path += 'section-' + sectionNum + '/';

    return path;
}

function parsePath(path: string): ParsedPath {

    let courseMatch = path.match(/course-(\d)/);
    let lessonMatch = path.match(/lesson-(\d)/);
    let sectionMatch = path.match(/section-(\d)/);
    let courseID: number;
    let lessonNum: number;
    let sectionNum: number;
    
    if (courseMatch) {
        courseID = +courseMatch[1];
        if (lessonMatch) {
            lessonNum = +lessonMatch[1];
            if (sectionMatch) {
                sectionNum = +sectionMatch[1];
            } else {
                sectionNum = 1;
            }
        } else {
            lessonNum = 1;
            sectionNum = 1;
        }
    } else {
        throw Error('Course does not exist.');
    }

    return {
        courseID: courseID,
        lessonNum: lessonNum,
        sectionNum: sectionNum
    };

}

interface CourseOutlineProps {
    currentCourse: Course;
    currentSection: Section;
    setSection: (course: Course, section: Section, history?: History) => AnyAction;

    match: match<{}>;
    location: Location;
    history: History;
}

interface CourseOutlineState {
    collapsedList: boolean[];
    firstLoad: boolean;
}

class UnconnectedCourseOutline extends React.Component<CourseOutlineProps, CourseOutlineState> {

    constructor(props: CourseOutlineProps) {
        super(props);

        this.state = {
            collapsedList: [],
            firstLoad: true
        };

        props.history.listen((location: Location, action: Action) => {
            if (action !== 'POP') { return; }
            let currentCourse = Store.getInstance().getState().learning.currentCourse;
            let currentSection = Store.getInstance().getState().learning.currentSection;
            let parsed = parsePath(location.pathname);
            if (!currentCourse || parsed.courseID !== currentCourse.id) {
                throw Error('Course changing not implemented.');
            }

            if (!currentSection || 
                parsed.sectionNum !== currentSection.number || 
                parsed.lessonNum !== currentSection.lessonNumber) {
                this.props.setSection(currentCourse,
                    currentCourse.lessons[parsed.lessonNum - 1].sections[parsed.sectionNum - 1]);
            }
        });

        Store.getInstance().subscribe(() => {
            let prevCourse = this.props.currentCourse;
            let currentCourse = Store.getInstance().getState().learning.currentCourse;
            if (currentCourse && prevCourse !== currentCourse) {
                // If changing courses, collapse everything to be safe.
                this.setState({
                    collapsedList: currentCourse.lessons.map(() => true)
                });
            }

            let prevSection = this.props.currentSection;
            let currentSection = Store.getInstance().getState().learning.currentSection;
            if (currentCourse && currentSection && prevSection !== currentSection) {
                // Collapse and uncollapse the appropriate lesson when switching sections.
                this.setState({
                    collapsedList: currentCourse.lessons.map((lesson) => {
                        if (currentSection) {
                            return lesson.number !== currentSection.lessonNumber;
                        }
                        return true;
                    })
                });
            }

            // First time the course gets set
            if (currentCourse && this.state.firstLoad) {
                this.setState({ firstLoad: false });
                let parsed = parsePath(location.pathname);
                this.props.setSection(currentCourse,
                    currentCourse.lessons[parsed.lessonNum - 1].sections[parsed.sectionNum - 1]);
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
                        onClick={() => this.props.setSection(this.props.currentCourse, section, this.props.history)}
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
        setSection: (course: Course, section: Section, history?: History) => {
            if (history) {
                history.push(createRouterPath(course.id,
                    section.lessonNumber,
                    section.number));
            }
            dispatch(Actions.selectSection(section));
        }
    };
};

const CourseOutline = connect(mapStateToProps, mapDispatchToProps)(UnconnectedCourseOutline);

export default withRouter(CourseOutline);