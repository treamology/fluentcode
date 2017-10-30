import { connect } from 'react-redux';
import DraggableList, { DraggableListProps } from '../components/draggable_list';
import { ApplicationState } from '../state/types';

const mapStateToProps = (state: ApplicationState, ownProps: DraggableListProps) => {
    return {
        codeBlocks: state.visibleCodeBlocks
    };
};

const CurrentDraggableList: React.ComponentClass = connect(mapStateToProps)(DraggableList);

export default CurrentDraggableList;