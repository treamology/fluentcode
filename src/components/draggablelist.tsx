import * as React from 'react';

import { CodeBlock } from '../state/types';
import Draggable from './draggable';

interface DraggableListProps {
    codeBlocks: Array<CodeBlock>;
}

// class DraggableList extends React.Component<DraggableListProps> {
//     render() {
//         return (
            
//         );
//     }
// }

const DraggableList = (props: DraggableListProps) => (
    <div>
    {
        props.codeBlocks.map((codeBlock, index) =>
            <Draggable 
                codeTitleText={codeBlock.codeTitleText}
                nonCodeTitleText={codeBlock.nonCodeTitleText}
                descriptionText={codeBlock.descriptionText} 
            />
        )
    }
    </div>
);

export default DraggableList;
export { DraggableListProps };