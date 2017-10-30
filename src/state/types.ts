interface ApplicationState {
    visibleCodeBlocks: Array<CodeBlock>;
}

interface CodeBlock {
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
    droppedCode: string;
}

export { ApplicationState, CodeBlock };