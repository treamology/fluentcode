import * as React from 'react';

enum TextOperation {
    insert = 'insert',
    delete = 'delete'
}
interface CharacterLocation {
    line: number;
    ch: number;
}
interface LineLocation {
    startCh: number;
    length: number;
}

// Type information gets stripped when compiled to regular javascript :(
enum WidgetType {
    textbox = "Textbox",
}
interface WidgetDimensions {
    x: number;
    y: number;
    width: number;
    height: number;
}

// Higher-level state information (not presentation related) for widgets.
interface WidgetState<> {
    type: WidgetType;
}
interface TextboxWidgetState extends WidgetState {
    enteredText: string;
    placeholder: string;
}

// Required base attributes for any widget component.
interface WidgetComponentProps {
    style: {};
    startChar: number;
}
class WidgetComponent<P = WidgetComponentProps, S = {}> extends React.Component<P, S> {}

interface TextboxWidgetComponentProps extends WidgetComponentProps {
    placeholder: string;
    enteredText: string;
    onChange: string;
}
class TextboxWidgetComponent extends React.Component<TextboxWidgetComponentProps> {
    constructor(props: TextboxWidgetComponentProps) {
        super(props);
        this.textChange = this.textChange.bind(this);
    }

    textChange() {

    }
    
    render() {
        <input
            style={this.props.style}
            className="textboxWidget"
            placeholder={this.props.placeholder}
            onChange={this.textChange}
        />
    }
}

interface WidgetContainerProps {
    cm: CodeMirror.Editor;
}
interface WidgetContainerState {
    
}
class WidgetContainer extends React.Component<WidgetContainerProps> {

    widgetComponents: WidgetState[];

    textChanged(operation: TextOperation, delta: string, start: CharacterLocation, end: CharacterLocation) {

    }

    handleToPos(line: CodeMirror.LineHandle): LineLocation {

    }

    indexToLoc(doc: CodeMirror.Doc, index: number): CharacterLocation {
        let accumulator = 0;
        
        let line = 0;
        let ch = 0;

        for (let lineNum = 0; lineNum < doc.lineCount(); lineNum++) {
            let charsInLine = doc.getLine(lineNum).length;
            accumulator += charsInLine;
            if (accumulator >= index) {
                ch = accumulator - index;
                break;
            }
        }
        
        return { line,  ch }
    }

    render() {
        let cm = this.props.cm;
        let doc = cm.getDoc();
        <div>
            {
                this.widgetComponents.map((widget, char) => {
                    
                    // Every widget has a staring position, but each calculation of the ending position
                    // is different for each widget.
                    let loc = this.indexToLoc(doc, char);
                    let startPosition = cm.charCoords(loc, 'local');

                    switch (widget.type) {
                        case WidgetType.textbox: {
                            let textboxState = widget as TextboxWidgetState;

                            // Calculate the ending position based on either the length of the placeholder
                            // or the length of the actual text.
                            let endChar = textboxState.enteredText ? textboxState.enteredText.length : textboxState.placeholder.length;
                            let endLoc = { line: loc.line, ch: endChar };
                            let endPosition = cm.charCoords(endLoc, 'local');

                            const style = {
                                left: startPosition.left,
                                top: startPosition.top,
                                width: endPosition.right - startPosition.left,
                                height: endPosition.bottom - endPosition.top - 1 // So the border doesn't get cut off
                            };

                            return <TextboxWidgetComponent
                                        style={style}
                                        placeholder={textboxState.placeholder}
                                        enteredText={textboxState.enteredText}
                                        startChar={char}
                                        key={char}
                                    />
                        }
                    }
                })
            }
        </div>
    }
}