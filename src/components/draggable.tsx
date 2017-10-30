import * as React from 'react';

import '../styles/draggable.scss';

interface DraggableProps {
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
}

class Draggable extends React.Component<DraggableProps> {
    render() {
        return (
            <div className="draggable">
                <span className="codeTitle">{this.props.codeTitleText}</span>
                <span className="nonCodeTitle"> {this.props.nonCodeTitleText}</span>
                <p className="description">{this.props.descriptionText}</p>
            </div>
        );
    }
}

export default Draggable;