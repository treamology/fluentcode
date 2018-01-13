import * as React from 'react';
import { DragSource, DragSourceMonitor, DndComponentClass, DndComponent, DragSourceConnector } from 'react-dnd';
import { DraggableTextField } from '../models';

import '../styles/draggable.scss';

interface DraggableProps {
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
    droppedCode: string;
    textFields: DraggableTextField[];
}

interface DraggablePropsCollected extends DraggableProps {
    connectDragSource: Function;
    isDragging: boolean;
}

interface DroppedCodeItem {
    droppedCode: string;
    textFields: DraggableTextField[]
}

const draggableSource = {
    beginDrag(props: DraggableProps) {
        return { droppedCode: props.droppedCode, textFields: props.textFields };
    },
    endDrag(props: DraggableProps, monitor: DragSourceMonitor, component: DndComponent<DraggableProps, {}>) {
        if (!monitor.didDrop()) {
            return;
        }

        return;
    }  
};

function collect(connect: DragSourceConnector, monitor: DragSourceMonitor) {
    return {
        connectDragSource: connect.dragSource(),
        isDragging: monitor.isDragging()
    };
}

class UnwrappedDraggable extends React.Component<DraggablePropsCollected> {
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

const Draggable: DndComponentClass<DraggableProps> =
    DragSource('Draggable', draggableSource, collect)(UnwrappedDraggable);

export default Draggable;
export { DroppedCodeItem };