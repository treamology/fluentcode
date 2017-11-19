export interface ApplicationState {
    apiKey: string;
    visibleCodeBlocks: Array<CodeBlock>;
    codeEditor: CodeEditorState;
    codeExecution: CodeExecutionState;
}

export interface CodeEditorState {
    currentEnteredCode: string;
}

export enum ExecutionState {
    none,
    running,
    success,
    failed,
}
export interface CodeExecutionState {
    state: ExecutionState;
}

export interface CodeBlock {
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
    droppedCode: string;
}

export module AsyncActionTypes {
    export interface ReceiveApiKeyAction {
        type: string,
        json: ResponseTypes.ReceiveApiKeyResponse
    };

    export const RECEIVE_API_KEY = 'RECEIVE_API_KEY';

    // API call sending code to execute
    export const REQUEST_RUN_CODE = 'REQUEST_RUN_CODE';
    export const RECEIVE_RUN_CODE = 'RECEIVE_RUN_CODE';
    
    // API call asking server about execution status
    export const REQUEST_CODE_STATUS = 'REQUEST_CODE_STATUS';
    export const RECEIVE_CODE_STATUS = 'RECEIVE_CODE_STATUS';

    export type RootActions = ReceiveApiKeyAction;
}

export module ActionTypes {
    export interface SetCodeAction {
        type: string;
        code: string;
    };

    export const SET_CODE = 'SET_CODE';

    export type CodeEditorActions = SetCodeAction;
}

export module ResponseTypes {
    export interface ReceiveApiKeyResponse {
        token: string;
    }
}