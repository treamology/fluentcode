interface ApplicationState {
    visibleCodeBlocks: Array<CodeBlock>;
    codeExecution: CodeExecutionState;
}

enum ExecutionState {
    none,
    running,
    success,
    failed,
}
interface CodeExecutionState {
    state: ExecutionState;
}

interface CodeBlock {
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
    droppedCode: string;
}

export { ApplicationState, ExecutionState, CodeExecutionState, CodeBlock };