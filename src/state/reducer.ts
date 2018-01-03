import {
    AsyncActionTypes,
    ResponseTypes,
    ActionTypes
    } from '../state/types/actions';
import {
    CodeExecutionState,
    ApplicationState,
    ExecutionState,
    CodeEditorState,
    LearningState,
} from '../state/types/state';
import { AnyAction } from 'redux';

// const defaultVisibleCodeBlocks: Array<DraggableData> = [
//     {id: 0,
//     codeName: 'if', 
//     descName: 'statement', 
//     descText: 'Something about an if statement.',
//     code: 'if \\conditional\\:\n    '},
//     {id: 0,
//     codeName: 'for', 
//     descName: 'loop', 
//     descText: 'Something about an for loop',
//     code: 'for [var] in [iterable]:'},
//     {id: 0,
//     codeName: 'while', 
//     descName: 'loop', 
//     descText: 'Something about an while loop',
//     code: 'while [conditional]:'},
//     {id: 0,
//     codeName: 'print', 
//     descName: '', 
//     descText: 'Something about printing',
//     code: 'print(\\string\\)'}
// ];

const defaultCodeExecutionState: CodeExecutionState = {
    state: ExecutionState.none,
    lastOutput: '',
    lastException: '',
    lastError: ''
};

const defaultCodeEditorState: CodeEditorState = {
    currentEnteredCode: '',
    textBoxes: {},
    requirementsOpen: false
};

const defaultLearningState: LearningState = {
    currentCourse: undefined,
    currentSection: undefined
};

const defaultApplicationState: ApplicationState = {
    apiKey: '',
    codeEditor: defaultCodeEditorState,
    codeExecution: defaultCodeExecutionState,
    learning: defaultLearningState,
    serverError: false,
    checkingConnection: false
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
            let stateObject = {
                state: json.status as ExecutionState,
                lastOutput: '',
                lastError: '',
                lastException: ''
            };
            if (json.status === ExecutionState.metafail) {
                stateObject.lastError = json.error;
            } else {
                stateObject.lastOutput = json.result;
                if (json.status === ExecutionState.failed) {
                    stateObject.lastException = json.error;
                }
            }

            return Object.assign({}, state, stateObject);
        case ActionTypes.RESET_EXECUTION_STATE:
            return Object.assign({}, state, {
               state: ExecutionState.none
            });
        default:
            return state;
    } 
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
        case ActionTypes.TOGGLE_REQUIREMENTS:
            return Object.assign({}, state, {
                requirementsOpen: !state.requirementsOpen
            });
        default:
            return state;
    }
}

function learning(state: LearningState, action: AnyAction) {
    switch (action.type) {
        case AsyncActionTypes.RECEIVE_COURSE_DETAIL:
            let course = action.json as ResponseTypes.CourseDetailResponse;
            return Object.assign({}, state, {
                currentCourse: course
            });
        case ActionTypes.SELECT_SECTION:
            let selectSectionAction = action as ActionTypes.SelectSectionAction;
            return Object.assign({}, state, {
                currentSection: selectSectionAction.section
            });
        case ActionTypes.COMPLETE_REQUIREMENTS:
            if (state.currentSection) {
                let completeRequirementsAction = action as ActionTypes.CompleteRequirementsAction;
//                let reqs = Object.assign({}, state.currentSection.requirements)
                let reqs = Array.from(state.currentSection.requirements);
                completeRequirementsAction.results.map((result, index) => {
                    reqs[index].completed = result.success;
                });
                return Object.assign({}, state, {
                    currentSection: Object.assign({}, state.currentSection, {
                        requirements: Array.from(reqs)
                    })
                });
            } else {
                return state;
            }
            
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
        case ActionTypes.CHECK_CONNECTION:
            return Object.assign({}, state, {
                checkingConnection: true
            });
        case ActionTypes.CONNECTION_OK:
            return Object.assign({}, state, {
                checkingConnection: false
            });
        default:
            return {
                apiKey: state.apiKey,
                codeExecution: codeExecution(state.codeExecution, action as AsyncActionTypes.CodeExecutionActions),
                codeEditor: codeEditor(state.codeEditor, action as ActionTypes.CodeEditorActions),
                learning: learning(state.learning, action as AsyncActionTypes.APIAction),
                serverError: state.serverError,
                checkingConnection: state.checkingConnection
            };
    }
}