import '../App.scss';

import * as React from 'react';

import { CodeBlock } from '../state/types';
import Draggable from './draggable';

interface DraggableListProps {
    codeBlocks: Array<CodeBlock>;
}

const DraggableList = (props: DraggableListProps) => (
    <div className="draggablesContainer">
    {
        props.codeBlocks.map((codeBlock, index) =>
            <Draggable 
                codeTitleText={codeBlock.codeTitleText}
                nonCodeTitleText={codeBlock.nonCodeTitleText}
                descriptionText={codeBlock.descriptionText}
                droppedCode={codeBlock.droppedCode}
                key={index}
            />
        )
    }
    </div>
);

export default DraggableList;
export { DraggableListProps };