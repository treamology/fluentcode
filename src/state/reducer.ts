import {
    CodeExecutionState,
    ApplicationState,
    ExecutionState,
    CodeBlock,
    CodeEditorState,
    AsyncActionTypes,
    ResponseTypes
    } from '../state/types';
import { ActionTypes } from '../state/types';
import { AnyAction } from 'redux';

const defaultVisibleCodeBlocks: Array<CodeBlock> = [
    {codeTitleText: 'if', 
    nonCodeTitleText: 'statement', 
    descriptionText: 'Something about an if statement.',
    droppedCode: 'if \\conditional\\ \\somethingelse\\:\n    code'},
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
    droppedCode: 'print(\\string\\)'}
];

const defaultCodeExecutionState: CodeExecutionState = {
    state: ExecutionState.none,
    lastOutput: ''
};

const defaultCodeEditorState: CodeEditorState = {
    currentEnteredCode: '',
    textBoxes: {}
};

const defaultApplicationState: ApplicationState = {
    apiKey: '',
    visibleCodeBlocks: defaultVisibleCodeBlocks,
    codeEditor: defaultCodeEditorState,
    codeExecution: defaultCodeExecutionState,
    serverError: false
};

function codeExecution(state: CodeExecutionState, action: AsyncActionTypes.CodeExecutionActions) {
    switch (action.type) {
        case AsyncActionTypes.REQUEST_RUN_CODE:
            return Object.assign({}, state, {
                state: ExecutionState.running
            });
        case AsyncActionTypes.RECEIVE_CODE_STATUS:
            let apiaction = action as AsyncActionTypes.APIAction;
            let json = apiaction.json as ResponseTypes.ExecStatusResponse;
            return Object.assign({}, state, {
                state: json.status as ExecutionState,
                lastOutput: json.result
            });
        case ActionTypes.RESET_EXECUTION_STATE:
            return Object.assign({}, state, {
               state: ExecutionState.none
            });
        default:
            return state;
    } 
}

function visibleCodeBlocks(state: Array<CodeBlock>, action: AnyAction) {
    return state;
}

function codeEditor(state: CodeEditorState, action: ActionTypes.CodeEditorActions) {
    switch (action.type) {
        case ActionTypes.SET_CODE:
            let codeAction = action as ActionTypes.SetCodeAction;
            return Object.assign({}, state, {
                currentEnteredCode: codeAction.code
            });
        case ActionTypes.SET_TEXTBOXES:
            let tbAction = action as ActionTypes.SetTextboxAction;
            let newTextboxes = { textBoxes: Object.assign({}, state.textBoxes, tbAction.changes)};
            return Object.assign({}, state, newTextboxes);
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
        case ActionTypes.SERVER_ERROR:
            return Object.assign({}, state, {
                serverError: true
            });
        default:
            return {
                apiKey: state.apiKey,
                codeExecution: codeExecution(state.codeExecution, action as AsyncActionTypes.CodeExecutionActions),
                codeEditor: codeEditor(state.codeEditor, action as ActionTypes.CodeEditorActions),
                visibleCodeBlocks: visibleCodeBlocks(state.visibleCodeBlocks, action),
                serverError: false
            };
    }
}

// const ocSite: Reducer<ApplicationState> = combineReducers({
//     visibleCodeBlocks,
//     codeExecution,
//     codeEditor,
// });

// export default ocSite;