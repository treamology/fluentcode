import * as React from 'react';
import { DragSource } from 'react-dnd';

import '../styles/draggable.scss';

interface DraggableProps {
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
    droppedCode: string;
}

interface DraggablePropsInjection extends DraggableProps {
    connectDragSource: Function;
}

const draggableSource = {
    beginDrag(props: DraggableProps) {
        return {droppedCode: props.droppedCode};
    },
    endDrag(props: DraggableProps, monitor: any, component: any) {
        if (!monitor.didDrop()) {
            return;
        }

        return;
    }
};

function collect(connect: any, monitor: any) {
    return {
        connectDragSource: connect.dragSource(),
        isDragging: monitor.isDragging()
    };
}

class NotDraggableDraggable extends React.Component<DraggablePropsInjection> {
    render() {
        return this.props.connectDragSource(
            <div className="draggable">
                <span className="codeTitle">{this.props.codeTitleText}</span>
                <span className="nonCodeTitle"> {this.props.nonCodeTitleText}</span>
                <p className="description">{this.props.descriptionText}</p>
            </div>
        );
    }
}

const Draggable: React.ComponentClass<DraggableProps> = DragSource("Draggable", draggableSource, collect)(NotDraggableDraggable);

export default Draggable;