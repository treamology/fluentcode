import { CodeExecutionState, ApplicationState, ExecutionState } from './types';
import { Dispatch, AnyAction } from 'redux';
import { ThunkAction } from 'redux-thunk';
import Store from '../store';
import * as Endpoints from '../endpoints';
import { ActionTypes, AsyncActionTypes, ResponseTypes } from './types';

export module Actions {
    export function setCode(code: string): ActionTypes.SetCodeAction {
        return {
            type: ActionTypes.SET_CODE,
            code
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
    export function resetExecutionState(): AnyAction {
        return {
            type: ActionTypes.RESET_EXECUTION_STATE
        };
    }

    export function runCode(): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<CodeExecutionState>) => {
            const currentCode = Store.getInstance().getState().codeEditor.currentEnteredCode;
            dispatch(requestRunCode(currentCode));
            
            Endpoints.callAPI(
                Endpoints.CODE_EXECUTE_ENDPOINT,
                'POST',
                JSON.stringify({
                    code: currentCode
                })
            ).then(
                (response: Response) => response.json(),
                (error: Error) => console.log(error)
            ).then(
                (json: ResponseTypes.RunCodeResponse) => {
                    dispatch(receiveRunCode(json));
                    setTimeout(() => {
                        dispatch(getCodeStatus());
                    }, 2000);
                }
            );
        };
    }
    export function getCodeStatus(): ThunkAction<void, {}, {}> {
        return (dispatch: Dispatch<CodeExecutionState>) => {
            Endpoints.callAPI(
                Endpoints.CODE_EXECUTE_ENDPOINT,
                'GET'
            ).then(
                (response: Response) => response.json(),
                (error: Error) => console.log(error)
            ).then(
                (json: ResponseTypes.ExecStatusResponse) => {
                    dispatch(receiveCodeStatus(json))
                    switch (json.status) {
                        case ExecutionState.running:
                            setTimeout(() => {
                                dispatch(getCodeStatus());
                            }, 2000);
                            return;
                        case ExecutionState.success:
                            setTimeout(() => {
                                dispatch(resetExecutionState());
                            }, 2000)
                            return;
                    }
                }
            )
        }
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
                (response: Response) => response.json(),
                (error: Error) => console.log(error)
            ).then(
                (json: ResponseTypes.ReceiveApiKeyResponse) => dispatch(receiveAPIKey(json))
            );
        }
    }
}