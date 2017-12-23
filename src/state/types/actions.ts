import { Course, CourseListing, Section } from '../../models';

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

    // Unimplemented
    export const RECEIVE_COURSE_LIST = 'RECEIVE_COURSE_LIST';

    // Received details of course
    export const RECEIVE_COURSE_DETAIL = 'RECEIVE_COURSE_DETAIL';

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
    export interface SelectSectionAction {
        type: string;
        section: Section;
    }
    
    export const SET_CODE = 'SET_CODE';
    export const SET_TEXTBOXES = 'SET_TEXTBOXES';

    export const RESET_EXECUTION_STATE = 'RESET_EXECUTION_STATE';

    export const SERVER_ERROR = 'SERVER_ERROR';
    export const CHECK_CONNECTION = 'CHECK_CONNECTION';
    export const CONNECTION_OK = 'CONNECTION_OK';

    export const SELECT_SECTION = 'SELECT_SECTION';

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
        exception: string;
        error: string;
    }
    export interface CourseListResponse {
        courses: CourseListing[];
    }
    export interface CourseDetailResponse extends Course {}

    export type AnyResponse = 
        ReceiveApiKeyResponse | 
        RunCodeResponse | 
        ExecStatusResponse | 
        CourseListResponse | 
        CourseDetailResponse;
}