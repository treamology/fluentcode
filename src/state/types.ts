interface ApplicationState {
    visibleCodeBlocks: Array<CodeBlock>;
}

interface CodeBlock {
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
}

export { ApplicationState, CodeBlock };