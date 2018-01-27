import { Section, Course, DraggableTextField } from '../../models';

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
    textBoxes: {};
    textboxData: Map<CodeMirror.LineHandle, Array<DraggableTextField>>;
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