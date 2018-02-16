import { Section, Course } from '../../models';
import { WidgetState } from '../../components/widgets/state';

export interface ApplicationState {
    apiKey: string;
    codeEditor: CodeEditorState;
    codeExecution: CodeExecutionState;
    learning: LearningState;
    serverError: boolean;
    checkingConnection: boolean;
}

export interface LearningState {
    currentCourse?: Course;
    currentSection?: Section;
}

export interface CodeEditorState {
    currentEnteredCode: string;
    requirementsOpen: boolean;
    codeMirror?: CodeMirror.Editor;
    widgetData: WidgetState[];
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
    lastException: string;
    lastError: string;
}