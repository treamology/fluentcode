import { CodeExecutionState } from "./types";
import { Dispatch } from 'redux';
import store from "../index";
import * from '../endpoints'

// export module ActionInterfaces {
    
// }

export module ActionTypes {
    export interface SetCodeAction {
        type: string;
        code: string;
    }

    export interface RunCodeAction {
        type: string;
    }

    export const SET_CODE = "SET_CODE";
    export const RUN_CODE = 'RUN_CODE';
}

export module Actions {
    export function setCode(code: string): ActionTypes.SetCodeAction {
        return {
            type: ActionTypes.SET_CODE,
            code
        }
    }
}

export module AsyncActionTypes {
    // API call sending code to execute
    export const REQUEST_RUN_CODE = 'REQUEST_RUN_CODE';
    export const RECEIVE_RUN_CODE = 'RECEIVE_RUN_CODE';
    
    // API call asking server about execution status
    export const REQUEST_CODE_STATUS = 'REQUEST_CODE_STATUS';
    export const RECEIVE_CODE_STATUS = 'RECEIVE_CODE_STATUS';
}

export module AsyncActions {
    export function requestRunCode(code: string) {
        return {
            type: AsyncActionTypes.REQUEST_RUN_CODE,
            code
        }
    }
    export function receiveRunCode(json: string) {
        return {
            type: AsyncActionTypes.RECEIVE_RUN_CODE,
            json
        }
    }
    export function runCode() {
        return (dispatch: Dispatch<CodeExecutionState>) => {
            dispatch(requestRunCode(store.getState().codeEditor.currentEnteredCode));

            fetch(`${}`);
        };
    }

    export function requestCodeStatus() {
        return {
            type: AsyncActionTypes.REQUEST_CODE_STATUS
        }
    }
    export function receiveCodeStatus(json: string) {
        return {
            type: AsyncActionTypes.RECEIVE_CODE_STATUS,
            json
        }
    }
}