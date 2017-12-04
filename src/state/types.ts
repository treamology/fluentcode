import {Section, Course, CodeBlock, CourseListing} from '../models';

export interface ApplicationState {
    apiKey: string;
    visibleCodeBlocks: Array<CodeBlock>;
    codeEditor: CodeEditorState;
    codeExecution: CodeExecutionState;
    learning: LearningState;
    serverError: boolean;
}

export interface LearningState {
    currentCourse?: Course;
    currentSection?: Section;
    currentDraggables?: CodeBlock[];
}

export interface CodeEditorState {
    currentEnteredCode: string;
    textBoxes: {};
}

export enum ExecutionState {
    none = -1,
    running = 2,
    success = 0,
    failed = 1,
    metafail = 3
}
export interface CodeExecutionState {
    state: ExecutionState;
    lastOutput: string;
}

export module AsyncActionTypes {
    export interface ReceiveApiKeyAction {
        type: string;
        json: ResponseTypes.ReceiveApiKeyResponse;
    }
    export interface RequestRunCodeAction {
        type: string;
        code: string;
    }
    export interface APIAction {
        type: string;
        json: ResponseTypes.AnyResponse;
    }

    export const RECEIVE_API_KEY = 'RECEIVE_API_KEY';

    // API call sending code to execute
    export const REQUEST_RUN_CODE = 'REQUEST_RUN_CODE';
    export const RECEIVE_RUN_CODE = 'RECEIVE_RUN_CODE';
    
    // API call asking server about execution status
    export const REQUEST_CODE_STATUS = 'REQUEST_CODE_STATUS';
    export const RECEIVE_CODE_STATUS = 'RECEIVE_CODE_STATUS';

    export const RECEIVE_COURSE_LIST = 'RECEIVE_COURSE_LIST';

    export type RootActions = ReceiveApiKeyAction;
    export type CodeExecutionActions = RequestRunCodeAction | APIAction;
}

export module ActionTypes {
    export interface SetCodeAction {
        type: string;
        code: string;
    }
    export interface SetTextboxAction {
        type: string;
        changes: {};
    }
    
    export const SET_CODE = 'SET_CODE';
    export const SET_TEXTBOXES = 'SET_TEXTBOXES';

    export const RESET_EXECUTION_STATE = 'RESET_EXECUTION_STATE';

    export const SERVER_ERROR = 'SERVER_ERROR';

    export type CodeEditorActions = SetCodeAction | SetTextboxAction;
}

export module ResponseTypes {
    export interface ReceiveApiKeyResponse {
        token: string;
    }
    export interface RunCodeResponse {
        success: boolean;
    }
    export interface ExecStatusResponse {
        status: number;
        result: string;
    }
    export interface CourseListResponse {
        courses: CourseListing[];
    }

    export type AnyResponse = ReceiveApiKeyResponse | RunCodeResponse | ExecStatusResponse | CourseListResponse;
}