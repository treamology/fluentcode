import { Section, CodeBlock, Course } from '../../models';

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