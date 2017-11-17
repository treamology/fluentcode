module ActionTypes {
    export const RUN_CODE = 'RUN_CODE';
}

module Actions {
    export function runCode(code: string) {
        return {
            type: ActionTypes.RUN_CODE,
            code
        }
    }
}

module AsyncActionTypes {
    // API call sending code to execute
    export const REQUEST_RUN_CODE = 'REQUEST_RUN_CODE';
    export const RECEIVE_RUN_CODE = 'RECEIVE_RUN_CODE';
    
    // API call asking server about execution status
    export const REQUEST_CODE_STATUS = 'REQUEST_CODE_STATUS';
    export const RECEIVE_CODE_STATUS = 'RECEIVE_CODE_STATUS';
}

module AsyncActions {
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