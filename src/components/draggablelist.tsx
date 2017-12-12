import '../App.scss';

import * as React from 'react';

import { Course } from '../models';
import Draggable from './draggable';
import { ApplicationState } from '../state/types/state';
import { connect } from 'react-redux';

interface DraggableListProps {
    currentCourse: Course
}

class UnconnectedDraggableList extends React.Component<DraggableListProps> {
    render() {
        let draggables: JSX.Element[] = [];
        if (this.props.currentCourse) {
            draggables = this.props.currentCourse.draggables.map((codeBlock, index) =>
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
        currentCourse: state.learning.currentCourse
    };
};

const DraggableList = connect(mapStateToProps)(UnconnectedDraggableList);

export default DraggableList;