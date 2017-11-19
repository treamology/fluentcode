import { CodeExecutionState, ApplicationState, ExecutionState, CodeBlock, CodeEditorState, AsyncActionTypes } from '../state/types';
import { ActionTypes } from '../state/types';
import { AnyAction } from 'redux';

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
    currentEnteredCode: ''
};

const defaultApplicationState: ApplicationState = {
    apiKey: '',
    visibleCodeBlocks: defaultVisibleCodeBlocks,
    codeEditor: defaultCodeEditorState,
    codeExecution: defaultCodeExecutionState
}

function codeExecution(state: CodeExecutionState, action: AnyAction) {
    return state;
}

function visibleCodeBlocks(state: Array<CodeBlock>, action: AnyAction) {
    return state;
}

function codeEditor(state: CodeEditorState, action: ActionTypes.CodeEditorActions) {
    switch (action.type) {
        case ActionTypes.SET_CODE:
            return Object.assign({}, state, {
                currentEnteredCode: action.code
            });
        default:
            return state;
    }
}

export default function ocSite(state: ApplicationState = defaultApplicationState, action: AnyAction): ApplicationState {
    switch (action.type) {
        case AsyncActionTypes.RECEIVE_API_KEY:
            return Object.assign({}, state, {
                apiKey: action.json.token
            });
        default:
            return {
                apiKey: state.apiKey,
                codeExecution: codeExecution(state.codeExecution, action),
                codeEditor: codeEditor(state.codeEditor, action as ActionTypes.CodeEditorActions),
                visibleCodeBlocks: visibleCodeBlocks(state.visibleCodeBlocks, action)
            };
    }
}

// const ocSite: Reducer<ApplicationState> = combineReducers({
//     visibleCodeBlocks,
//     codeExecution,
//     codeEditor,
// });

// export default ocSite;