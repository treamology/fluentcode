import * as React from 'react';

import { ApplicationState } from '../state/types/state';
import { connect } from 'react-redux';
import { DroppedCodeItem } from './draggable';
// import { Store } from 'redux';

enum TextOperation {
    insert = 'insert',
    delete = 'delete'
}
interface CharacterLocation {
    line: number;
    ch: number;
}
// interface LineLocation {
//     startCh: number;
//     length: number;
// }

// Type information gets stripped when compiled to regular javascript :(
enum WidgetType {
    textbox = "Textbox",
}
// interface WidgetDimensions {
//     x: number;
//     y: number;
//     width: number;
//     height: number;
// }

// Higher-level state information (not presentation related) for widgets.
interface WidgetState<> {
    type: WidgetType;
}
interface TextboxWidgetState extends WidgetState {
    enteredText: string;
    placeholder: string;
    onChange: (change: string) => void;
}

// Required base attributes for any widget component.
interface WidgetComponentProps {
    style: {};
    startChar: number;
}
// class WidgetComponent<P = WidgetComponentProps, S = {}> extends React.Component<P, S> {}

interface TextboxWidgetComponentProps extends WidgetComponentProps {
    placeholder: string;
    enteredText?: string;
    onChange?: (change: string) => void;
}
class TextboxWidgetComponent extends React.Component<TextboxWidgetComponentProps> {
    constructor(props: TextboxWidgetComponentProps) {
        super(props);
        this.textChange = this.textChange.bind(this);
    }

    textChange() {

    }
    
    render() {
        return (<input
            style={this.props.style}
            className="textboxWidget"
            placeholder={this.props.placeholder}
            onChange={this.textChange}
        />);
    }
}

interface WidgetContainerProps {
    cm: CodeMirror.Editor;
    currentText: string;
    // store: Store<ApplicationState>;
}
interface WidgetContainerState {
    widgetComponents: WidgetState[];
}
export class UnconnectedWidgetContainer extends React.Component<WidgetContainerProps, WidgetContainerState> {

    // widgetComponents: WidgetState[];

    constructor(props: WidgetContainerProps) {
        super(props);
        this.state = {
            widgetComponents: []
        };
    }

    textChanged(operation: TextOperation, delta: string, start: CharacterLocation, end: CharacterLocation, lastDrop?: DroppedCodeItem) {
        if (!lastDrop) { return; }
        switch (operation) {
            case TextOperation.insert:
                let newWidgets: WidgetState[] = [];
                for (let field of lastDrop.textFields) {
                    let line = start.line + field.lineNumber;
                    let char = start.ch + field.startChar;
                    let index = this.locToIndex(this.props.cm.getDoc(), { line, ch: char });
                    newWidgets[index] = { type: WidgetType.textbox, placeholder: field.placeholderText } as TextboxWidgetState;
                }
                this.setState((prevState) => {
                    newWidgets.forEach((state, index) => {
                        prevState.widgetComponents[index] = state;
                    });
                    return prevState;
                });
                break;
            case TextOperation.delete:
                break;
        }
    }

    checkChange(operation: TextOperation, delta: string, start: CharacterLocation, end: CharacterLocation, lastDrop?: DroppedCodeItem): boolean {
        if (!lastDrop) { return true; }
        return true;
    }

    // handleToPos(line: CodeMirror.LineHandle): LineLocation {
        
    // }

    componentWillMount() {
        this.setState((prevState) => {
            prevState.widgetComponents[15] = {
                type: WidgetType.textbox,
                placeholder: "hello"
            } as TextboxWidgetState;
            return prevState;
        });
    }

    indexToLoc(doc: CodeMirror.Doc, index: number): CharacterLocation {
        let accumulator = 0;
        
        let line = 0;
        let ch = 0;

        for (let lineNum = 0; lineNum < doc.lineCount(); lineNum++) {
            let lastCharIndex = doc.getLine(lineNum).length - 1;
            accumulator += lastCharIndex;
            if (accumulator >= index) {
                ch = accumulator - lastCharIndex + index;
                break;
            }
        }
        
        return { line,  ch }
    }

    locToIndex(doc: CodeMirror.Doc, loc: CharacterLocation): number {
        let charIndex = 0;
        for (let lineNum = 0; lineNum < loc.line; lineNum++ ) {
            // if (lineNum > loc.line) { break; }
            charIndex += doc.getLine(lineNum).length - 1;
        }
        charIndex += loc.ch;

        return charIndex;
    }

    render() {
        let cm = this.props.cm;
        let doc = cm.getDoc();
        return <div>
            {
                this.state.widgetComponents.map((widget, char) => {
                    
                    // Every widget has a staring position, but each calculation of the ending position
                    // is different for each widget.
                    let loc = this.indexToLoc(doc, char);
                    let startPosition = cm.charCoords(loc, 'local');

                    switch (widget.type) {
                        case WidgetType.textbox: {
                            let textboxState = widget as TextboxWidgetState;

                            // Calculate the ending position based on either the length of the placeholder
                            // or the length of the actual text.
                            let endChar = textboxState.enteredText ? textboxState.enteredText.length - 1: textboxState.placeholder.length - 1;
                            let endLoc = { line: loc.line, ch: loc.ch + endChar };
                            let endPosition = cm.charCoords(endLoc, 'local');

                            const style = {
                                left: startPosition.left,
                                top: startPosition.top,
                                width: endPosition.right - startPosition.left,
                                height: endPosition.bottom - endPosition.top // - 1 // So the border doesn't get cut off
                            };

                            return <TextboxWidgetComponent
                                        style={style}
                                        placeholder={textboxState.placeholder}
                                        enteredText={textboxState.enteredText}
                                        startChar={char}
                                        key={char}
                                        onChange={textboxState.onChange}
                                    />
                        }
                    }
                })
            }
        </div>
    }
}

const mapStateToWidgetContainerProps = (state: ApplicationState) => {
    return {
        currentText: state.codeEditor.currentEnteredCode
    };
};

const WidgetContainer = connect(mapStateToWidgetContainerProps, null, null, { withRef: true })(UnconnectedWidgetContainer);

export { TextOperation, WidgetContainer }