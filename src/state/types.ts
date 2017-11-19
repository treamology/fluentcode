export interface ApplicationState {
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