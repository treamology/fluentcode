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
import { TextboxWidgetState } from '../components/widgets/state';

const defaultCodeExecutionState: CodeExecutionState = {
    state: ExecutionState.none,
    lastOutput: '',
    lastException: '',
    lastError: '',
    currentInputs: []
};
const defaultCodeEditorState: CodeEditorState = {
    currentEnteredCode: '',
    requirementsOpen: true,
    codeMirror: undefined,
    widgetData: []
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

function codeExecution(
    state: CodeExecutionState,
    action: AsyncActionTypes.CodeExecutionActions | ActionTypes.CodeExecutionActions
) {
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
               state: ExecutionState.none,
               currentInputs: []
            });
        case ActionTypes.UPDATE_INPUTS:
            let inputAction = action as ActionTypes.UpdateInputsAction;
            return Object.assign({}, state, {
                currentInputs: state.currentInputs.concat([inputAction.input])
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
        case ActionTypes.CODEMIRROR_INIT:
            let cmInitAction = action as ActionTypes.CodeMirrorInitAction;
            return Object.assign({}, state, {
                codeMirror: cmInitAction.cm
            });
        case ActionTypes.TOGGLE_REQUIREMENTS:
            return Object.assign({}, state, {
                requirementsOpen: !state.requirementsOpen
            });
        case ActionTypes.ADD_WIDGET: {
            let addAction = action as ActionTypes.AddWidgetAction;
            let newData = state.widgetData.slice();

            addAction.widgets.forEach((bundle) => {
                newData[bundle.position] = bundle.widget;
            });

            return Object.assign({}, state, {
                widgetData: newData
            });
        }
        case ActionTypes.REMOVE_WIDGET: {
            let removeAction = action as ActionTypes.RemoveWidgetAction;
            let newData = state.widgetData.slice();
            removeAction.position.forEach((position) => {
                delete newData[position];
            });
            return Object.assign({}, state, {
                widgetData: newData
            });
        }
        case ActionTypes.MOVE_WIDGET: {
            let moveAction = action as ActionTypes.MoveWidgetAction;
            let newData = state.widgetData.slice();
            moveAction.moves.forEach((move) => {
                let movedWidget = newData[move.from];
                delete newData[move.from];
                newData[move.to] = movedWidget;
            });
            return Object.assign({}, state, {
                widgetData: newData
            });
        }
        case ActionTypes.UPDATE_TEXTBOX_WIDGET_TEXT: {
            let updateAction = action as ActionTypes.UpdateTextboxWidgetTextAction;
            let textbox = state.widgetData[updateAction.index] as TextboxWidgetState;
            let newData = state.widgetData.slice();
            textbox.enteredText = updateAction.text;
            newData[updateAction.index] = textbox;
            return Object.assign({}, state, {
                widgetData: newData 
            });
        }
        default:
            return state;
    }
}

function learning(state: LearningState, action: AnyAction) {
    switch (action.type) {
        case AsyncActionTypes.RECEIVE_COURSE_DETAIL:
            let courseAction = action.json as ResponseTypes.CourseDetailResponse;
            return Object.assign({}, state, {
                currentCourse: courseAction
            });
        case ActionTypes.SELECT_SECTION:
            let selectSectionAction = action as ActionTypes.SelectSectionAction;
            return Object.assign({}, state, {
                currentSection: selectSectionAction.section
            });
        case ActionTypes.COMPLETE_REQUIREMENTS:
            if (state.currentSection) {
                let completeRequirementsAction = action as ActionTypes.CompleteRequirementsAction;
                let course = state.currentCourse;
                
                let reqs = Array.from(state.currentSection.requirements);
                let numComplete = 0;
                completeRequirementsAction.results.map((result, index) => {
                    reqs[index].completed = result.success;
                    if (result.success) { numComplete++; }
                });

                let lessons = course!.lessons;
                let currentLesson = lessons[state.currentSection.lessonNumber - 1];
                let currentSection = currentLesson.sections[state.currentSection.number - 1];
                
                currentSection.completed = numComplete === reqs.length;
                currentSection.requirements = Array.from(reqs);

                currentLesson.sections[state.currentSection.number - 1] = currentSection;
                lessons[state.currentSection.lessonNumber - 1] = currentLesson;

                return Object.assign({}, state, 
                    {
                        currentCourse: Object.assign({}, state.currentCourse,
                            {
                                lessons: Array.from(lessons)
                            }
                        ),
                        currentSection: Object.assign({}, currentSection)    
                    }
                );

            } else {
                return state;
            }
        case AsyncActionTypes.REQUEST_COMPLETE_SECTION:
            if (state.currentSection) {
                let completeSectionAction = action as AsyncActionTypes.RequestCompleteSectionAction;
                let theSection = completeSectionAction.section;

                let course = state.currentCourse;
                let lessons = course!.lessons;
                let currentLesson = lessons[theSection.lessonNumber - 1];
                let currentSection = currentLesson.sections[theSection.number - 1];
                
                currentSection.completed = true;

                currentLesson.sections[state.currentSection.number - 1] = currentSection;
                lessons[state.currentSection.lessonNumber - 1] = currentLesson;

                return Object.assign({}, state, 
                    {
                        currentCourse: Object.assign({}, state.currentCourse,
                            {
                                lessons: Array.from(lessons)
                            }
                        ),
                        currentSection: Object.assign({}, currentSection)    
                    }
                );
            }
            return state;
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