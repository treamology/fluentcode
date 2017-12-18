import '../App.scss';

import * as React from 'react';

import { Course, Section, DraggableData } from '../models';
import Draggable from './draggable';
import { ApplicationState } from '../state/types/state';
import { connect } from 'react-redux';

interface DraggableListProps {
    currentCourse: Course
    currentSection: Section
}

class UnconnectedDraggableList extends React.Component<DraggableListProps> {
    render() {
        let draggableData: DraggableData[] = [];
        let draggables: JSX.Element[] = [];


        if (this.props.currentCourse && this.props.currentSection) {
            for (let id in this.props.currentSection.draggables) {
                draggableData.push(this.props.currentCourse.draggables[id])
            }

            draggables = draggableData.map((codeBlock, index) =>
                <Draggable 
                    codeTitleText={codeBlock.codeName}
                    nonCodeTitleText={codeBlock.descName}
                    descriptionText={codeBlock.descText}
                    droppedCode={codeBlock.code}
                    key={index}
                />
            )

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