import { CodeExecutionState, ApplicationState, ExecutionState } from './types/state';
import { Dispatch, AnyAction } from 'redux';
import { ThunkAction } from 'redux-thunk';
import Store from '../store';
import * as Endpoints from '../endpoints';
import { ActionTypes, AsyncActionTypes, ResponseTypes } from './types/actions';
import { Section, TestResult, DraggableTextField } from '../models';
import * as qs from 'query-string';
import { TextBoxProps } from '../components/widgets/textbox';

export module Actions {
    export function setCode(code: string): ActionTypes.SetCodeAction {
        return {
            type: ActionTypes.SET_CODE,
            code
        };
    }
    export function setTextboxes(changes: Map<CodeMirror.LineHandle, Array<TextBoxProps>>): ActionTypes.SetTextboxAction {
        return {
            type: ActionTypes.SET_TEXTBOXES,
            changes
        };
    }
    export function setTextboxData(data: Map<CodeMirror.LineHandle, Array<DraggableTextField>>): ActionTypes.SetTextboxDataAction {
        return {
            type: ActionTypes.SET_TEXTBOX_DATA,
            data
        };
    }
    export function serverError(): AnyAction {
        return {
            type: ActionTypes.SERVER_ERROR
        };
    }
    export function checkingConnection(): AnyAction {
        return {
            type: ActionTypes.CHECK_CONNECTION
        };
    }
    export function connectionOK(): AnyAction {
        return {
            type: ActionTypes.CONNECTION_OK
        };
    }
    export function selectSection(section: Section): AnyAction {
        return {
            type: ActionTypes.SELECT_SECTION,
            section: section
        };
    }
    export function toggleRequirements(): AnyAction {
        return {
            type: ActionTypes.TOGGLE_REQUIREMENTS
        };
    }
}

export module AsyncActions {
    export function receiveAPIKey(json: ResponseTypes.ReceiveApiKeyResponse): AsyncActionTypes.ReceiveApiKeyAction {
        return {
            type: AsyncActionTypes.RECEIVE_API_KEY,
            json: json
        };
    }

    export function requestRunCode(code: string): AsyncActionTypes.RequestRunCodeAction {
        return {
            type: AsyncActionTypes.REQUEST_RUN_CODE,
            code
        };
    }
    export function receiveRunCode(json: ResponseTypes.RunCodeResponse): AsyncActionTypes.APIAction {
        return {
            type: AsyncActionTypes.RECEIVE_RUN_CODE,
            json
        };
    }
    export function receiveCodeStatus(json: ResponseTypes.ExecStatusResponse): AsyncActionTypes.APIAction {
        return {
            type: AsyncActionTypes.RECEIVE_CODE_STATUS,
            json
        };
    }
    export function receiveCourseList(json: ResponseTypes.CourseListResponse): AsyncActionTypes.APIAction {
        return {
            type: AsyncActionTypes.RECEIVE_COURSE_LIST,
            json
        };
    }
    export function receiveCourseDetail(json: ResponseTypes.CourseDetailResponse): AsyncActionTypes.APIAction {
        return {
            type: AsyncActionTypes.RECEIVE_COURSE_DETAIL,
            json
        };
    }
    export function resetExecutionState(): AnyAction {
        return {
            type: ActionTypes.RESET_EXECUTION_STATE
        };
    }
    export function completeRequirements(results: TestResult[]): ActionTypes.CompleteRequirementsAction {
        return {
            type: ActionTypes.COMPLETE_REQUIREMENTS,
            results: results
        };
    }
    export function checkConnection(): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<ApplicationState>) => {
            Endpoints.callAPI(
                Endpoints.HEARTBEAT_ENDPOINT,
                'GET'
            ).then(() => dispatch(Actions.connectionOK())
            ).catch(() => {
                dispatch(Actions.checkingConnection());
                setTimeout(() => {
                    dispatch(checkConnection());
                }, 2000);
            });
        };
    }
    export function runCode(): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<CodeExecutionState>) => {
            const currentCode = Store.getInstance().getState().codeEditor.currentEnteredCode;
            const currentSection = Store.getInstance().getState().learning.currentSection;
            let sectionID;
            if (currentSection) {
                sectionID = currentSection.id;
            }
            dispatch(requestRunCode(currentCode));
            
            Endpoints.callAPI(
                Endpoints.CODE_EXECUTE_ENDPOINT,
                'POST',
                JSON.stringify({
                    code: currentCode,
                    section_id: sectionID
                })
            ).then(
                (response: Response) => response.json()
            ).then(
                (json: ResponseTypes.RunCodeResponse) => {
                    dispatch(receiveRunCode(json));
                    setTimeout(() => {
                        dispatch(getCodeStatus());
                    }, 2000);
                }
            ).catch(() => {
                dispatch(resetExecutionState());
                dispatch(checkConnection());
            });
        };
    }
    export function getCodeStatus(): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<CodeExecutionState>) => {
            Endpoints.callAPI(
                Endpoints.CODE_EXECUTE_ENDPOINT,
                'GET'
            ).then(
                (response: Response) => response.json()
            ).then(
                (json: ResponseTypes.ExecStatusResponse) => {
                    dispatch(receiveCodeStatus(json));
                    switch (json.status) {
                        case ExecutionState.running:
                            setTimeout(() => {
                                dispatch(getCodeStatus());
                            }, 2000);
                            return;
                        case ExecutionState.success:
                            if (json.results) {
                                dispatch(completeRequirements(json.results));
                            }
                            // falls through
                        default:
                            setTimeout(() => {
                                dispatch(resetExecutionState());
                            }, 2000);
                            return;
                    }
                }
            ).catch(() => {
                dispatch(resetExecutionState());
                dispatch(checkConnection());
            });
        };
    }
    export function getAPIKey(): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<ApplicationState>) => {
            Endpoints.callAPI(
                Endpoints.API_KEY_ENDPOINT,
                'POST',
                JSON.stringify({
                    username: 'testuser',
                    password: 'testuser'
                })
            ).then(
                (response: Response) => response.json()
            ).then(
                (json: ResponseTypes.ReceiveApiKeyResponse) => {
                    dispatch(receiveAPIKey(json));
                    dispatch(AsyncActions.getCourseDetail(1));
                }
            ).catch(
                (error: Error) => {
                    dispatch(Actions.serverError());
                }
            );
        };
    }
    export function getCourseList(): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<ApplicationState>) => {
            Endpoints.callAPI(
                Endpoints.COURSE_LIST_ENDPOINT,
                'POST'
            ).then(
                (response: Response) => response.json()

            ).then(
                (json: ResponseTypes.CourseListResponse) => dispatch(receiveCourseList(json))
            ).catch(() => dispatch(checkConnection())
            );
        };
    }
    export function getCourseDetail(id: number): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<ApplicationState>) => {
            Endpoints.callAPI(
                Endpoints.COURSE_DETAIL_ENDPOINT,
                'GET',
                qs.stringify({
                    id: id
                })
            ).then(
                (response: Response) => response.json()
            ).then(
                (json: ResponseTypes.CourseDetailResponse) => dispatch(receiveCourseDetail(json))
            ).catch(() => dispatch(checkConnection())
            );
        };
    }
}