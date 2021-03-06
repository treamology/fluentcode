import { Course, CourseListing, Section, TestResult } from '../../models';
import { WidgetState } from '../../components/widgets/state';

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
    export interface ResponseAction {
        type: string;
        response: Response;
    }
    export interface RequestCompleteSectionAction {
        type: string;
        section: Section;
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

    export const REQUEST_COMPLETE_SECTION = 'REQUEST_COMPLETE_SECTION';
    export const RECEIVE_COMPLETE_SECTION = 'RECEIVE_COMPLETE_SECTION';

    export type RootActions = ReceiveApiKeyAction;
    export type CodeExecutionActions = RequestRunCodeAction | APIAction;
}

export interface WidgetRepresentation {
    widget: WidgetState;
    position: number;
}
export interface WidgetMove {
    from: number;
    to: number;
}

export module ActionTypes {
    export interface SetCodeAction {
        type: string;
        code: string;
    }
    export interface SelectSectionAction {
        type: string;
        section: Section;
    }
    export interface CompleteRequirementsAction {
        type: string;
        results: TestResult[];
    }
    export interface CodeMirrorInitAction {
        type: string;
        cm: CodeMirror.Editor;
    }

    export interface AddWidgetAction {
        type: string;
        widgets: WidgetRepresentation[];
    }
    export interface RemoveWidgetAction {
        type: string;
        position: number[];
    }
    export interface MoveWidgetAction {
        type: string;
        moves: WidgetMove[];
    }
    export interface UpdateTextboxWidgetTextAction {
        type: string;
        index: number;
        text: string;
    }
    export interface UpdateInputsAction {
        type: string;
        input: string;
    }
    
    export const SET_CODE = 'SET_CODE';
    export const CODEMIRROR_INIT = 'CODEMIRROR_INIT';

    export const RESET_EXECUTION_STATE = 'RESET_EXECUTION_STATE';

    export const SERVER_ERROR = 'SERVER_ERROR';
    export const CHECK_CONNECTION = 'CHECK_CONNECTION';
    export const CONNECTION_OK = 'CONNECTION_OK';

    export const SELECT_SECTION = 'SELECT_SECTION';
    export const TOGGLE_REQUIREMENTS = 'TOGGLE_REQUIREMENTS';

    export const COMPLETE_REQUIREMENTS = 'COMPLETE_REQUIREMENTS';

    export const MOVE_WIDGET = 'MOVE_WIDGET';
    export const ADD_WIDGET = 'ADD_WIDGET';
    export const REMOVE_WIDGET = 'REMOVE_WIDGET';
    export const UPDATE_TEXTBOX_WIDGET_TEXT = 'UPDATE_TEXTBOX_WIDGET_TEXT';

    export const UPDATE_INPUTS = 'UPDATE_INPUTS';

    export type CodeEditorActions = 
        SetCodeAction |
        CodeMirrorInitAction |
        AddWidgetAction |
        RemoveWidgetAction |
        MoveWidgetAction |
        UpdateTextboxWidgetTextAction;
    export type CodeExecutionActions =
        UpdateInputsAction;
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
        results: TestResult[];
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