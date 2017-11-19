import { CodeExecutionState, ApplicationState } from './types';
import { Dispatch } from 'redux';
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

    export function requestRunCode(code: string) {
        return {
            type: AsyncActionTypes.REQUEST_RUN_CODE,
            code
        };
    }
    export function receiveRunCode(json: string) {
        return {
            type: AsyncActionTypes.RECEIVE_RUN_CODE,
            json
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
            );

            // fetch(`${Endpoints.PROTO}${Endpoints.ROOT}${Endpoints.CODE_EXECUTE_ENDPOINT}`, {
            //     method: 'POST',
            //     mode: 'cors',
            //     headers: new Headers({
            //         'Content-Type': 'text/json',
            //     }),
            //     body: JSON.stringify({
            //         code: currentCode
            //     })
            // });
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
                (response: Response) => response.json(),
                (error: Error) => console.log(error)
            ).then(
                (json: ResponseTypes.ReceiveApiKeyResponse) => dispatch(receiveAPIKey(json))
            );
        }
    }

    export function requestCodeStatus() {
        return {
            type: AsyncActionTypes.REQUEST_CODE_STATUS
        };
    }
    export function receiveCodeStatus(json: string) {
        return {
            type: AsyncActionTypes.RECEIVE_CODE_STATUS,
            json
        };
    }
}