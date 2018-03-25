import '../App.scss';

import * as React from 'react';

import { Course, Section, DraggableData, draggableByID } from '../models';
import Draggable from './draggable';
import { ApplicationState } from '../state/types/state';
import { connect } from 'react-redux';

interface DraggableListProps {
    currentCourse: Course;
    currentSection: Section;
}

class UnconnectedDraggableList extends React.Component<DraggableListProps> {
    render() {
        let draggableData: DraggableData[] = [];
        let draggables: JSX.Element[] = [];

        if (this.props.currentCourse && this.props.currentSection) {
            for (let index of Object.keys(this.props.currentSection.draggables)) {
                let id = this.props.currentSection.draggables[index];
                draggableData.push(draggableByID(id, this.props.currentCourse.draggables)!);
            }

            draggables = draggableData.map((codeBlock, index) =>
                (
                <Draggable 
                    codeTitleText={codeBlock.codeName}
                    nonCodeTitleText={codeBlock.descName}
                    descriptionText={codeBlock.descText}
                    droppedCode={codeBlock.code}
                    textFields={codeBlock.textFields}
                    key={index}
                />
                )
            );

        }
        
        return (
        <div className="draggablesContainer">
            {draggables}
        </div>);
    }
}

const mapStateToProps = (state: ApplicationState) => {
    return {
        currentCourse: state.learning.currentCourse,
        currentSection: state.learning.currentSection
    };
};

const DraggableList = connect(mapStateToProps)(UnconnectedDraggableList);

export default DraggableList;