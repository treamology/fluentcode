import { CodeExecutionState, ApplicationState, ExecutionState, CodeBlock, CodeEditorState } from '../state/types';
import { ActionTypes } from '../state/actions'
import { AnyAction, combineReducers, Reducer } from 'redux';

const defaultVisibleCodeBlocks: Array<CodeBlock> = [
    {codeTitleText: 'if', 
    nonCodeTitleText: 'statement', 
    descriptionText: 'Something about an if statement.',
    droppedCode: 'if [conditional]:'},
    {codeTitleText: 'for', 
    nonCodeTitleText: 'loop', 
    descriptionText: 'Something about an for loop',
    droppedCode: 'for [var] in [iterable]:'},
    {codeTitleText: 'while', 
    nonCodeTitleText: 'loop', 
    descriptionText: 'Something about an while loop',
    droppedCode: 'while [conditional]:'},
    {codeTitleText: 'print', 
    nonCodeTitleText: '', 
    descriptionText: 'Something about printing',
    droppedCode: 'print([string])'}
];

const defaultCodeExecutionState: CodeExecutionState = {
    state: ExecutionState.none
};

const defaultCodeEditorState: CodeEditorState = {
    currentEnteredCode: ""
}

function codeExecution(state: CodeExecutionState = defaultCodeExecutionState, action: AnyAction) {
    return state;
}

function visibleCodeBlocks(state: Array<CodeBlock> = defaultVisibleCodeBlocks, action: AnyAction) {
    return state;
}

function codeEditorState(state: CodeEditorState = defaultCodeEditorState, anyAction: AnyAction) {
    switch (anyAction.type) {
        case ActionTypes.SET_CODE:
            let action = anyAction as ActionTypes.SetCodeAction
            return Object.assign({}, state, {
                currentEnteredCode: action.code
            });
        default:
            return state;
    }
}

const ocSite: Reducer<ApplicationState> = combineReducers({
    visibleCodeBlocks,
    codeExecution,
    codeEditorState
});

export default ocSite;