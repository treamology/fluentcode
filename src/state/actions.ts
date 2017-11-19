import { CodeExecutionState } from './types';
import { Dispatch } from 'redux';
import { ThunkAction } from 'redux-thunk';
import Store from '../store';
import * as Endpoints from '../endpoints';
import { ActionTypes, AsyncActionTypes } from './types';

export module Actions {
    export function setCode(code: string): ActionTypes.SetCodeAction {
        return {
            type: ActionTypes.SET_CODE,
            code
        };
    }
}

export module AsyncActions {

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
            dispatch(requestRunCode(Store.getInstance().getState().codeEditor.currentEnteredCode));

            fetch(`${Endpoints.ROOT}${Endpoints.CODE_EXECUTE_ENDPOINT}`);
        };
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