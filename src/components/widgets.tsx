import * as React from 'react';

import { ApplicationState, CodeEditorState } from '../state/types/state';
import { WidgetRepresentation, WidgetMove } from '../state/types/actions';
import { Actions } from '../state/actions';
import { connect } from 'react-redux';
import { Dispatch } from 'redux';
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
export interface WidgetState<> {
    type: WidgetType;
    getWidth: (widget: WidgetState) => number;
}
interface TextboxWidgetState extends WidgetState {
    enteredText: string;
    placeholder: string;
    onChange: (change: string) => void;
    //getWidth: (enteredText: string, placeholder: string) => number;
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
    widgetData: WidgetState[];
    addWidget: (widgets: WidgetRepresentation[]) => void;
    removeWidget: (position: number[]) => void;
    moveWidget: (moves: WidgetMove[]) => void;
    // store: Store<ApplicationState>;
}
// interface WidgetContainerState {
//     widgetComponents: WidgetState[];
// }
export class UnconnectedWidgetContainer extends React.Component<WidgetContainerProps> {

    // widgetComponents: WidgetState[];

    constructor(props: WidgetContainerProps) {
        super(props);
    }

    textChanged(operation: TextOperation, delta: string, start: CharacterLocation, end: CharacterLocation, lastDrop?: DroppedCodeItem, removed: string = '') {
        
        let startIndex = this.locToIndex(this.props.cm.getDoc(), start);
        let endIndex = this.locToIndex(this.props.cm.getDoc(), end);

        let removalList: number[] = [];
        // If the start of the selection or character insertion goes inside a widget, but doesn't necessarily hit the start character
        for (let index = startIndex; index >= 0; --index) {
            if (!this.props.widgetData[index]) { continue; }

            let widget = this.props.widgetData[index];
            let widgetEnd = index + widget.getWidth(widget);

            if (startIndex < widgetEnd) {
                removalList.push(index);
            }
        }

        // If some text was removed, make sure we remove the textboxes that are overlaying them.
        if (removed !== '') {
            // Go through the selection and delete any widgets that are inside.
            for (let index = startIndex; index < endIndex; index++) {
                if (!this.props.widgetData[index]) { continue; }
                removalList.push(index);
            }
        }

        this.props.removeWidget(removalList);

        // Next, we need to move all of the widgets that have been displaced by this update.
        let insertLength = delta.replace(/\n/g, '').length; // Newlines don't count as characters here.
        let removeLength = removed.replace(/\n/g, '').length;
        let moves: WidgetMove[] = [];
        
        this.props.widgetData.forEach((widget, index) => {
            // Widgets might run over each other here? I don't know if the order I do this matters or not.
            if (index < startIndex) { return; }

            moves.push({ from: index, to: index + insertLength - removeLength });
        });
        this.props.moveWidget(moves);
        
        if (operation === TextOperation.insert && lastDrop) {
            // TODO: right now this is constrained to just textboxes, we need to update DroppedCodeItem
            // Create a list of the next widgets, then update the state with them.
            let newWidgets: WidgetState[] = [];
            for (let field of lastDrop.textFields) {
                let line = start.line + field.lineNumber;
                let char = start.ch + field.startChar;
                let index = this.locToIndex(this.props.cm.getDoc(), { line, ch: char });
                newWidgets[index] = { type: WidgetType.textbox, placeholder: field.placeholderText, getWidth: (widget: TextboxWidgetState) => widget.enteredText ? widget.enteredText.length: widget.placeholder.length } as TextboxWidgetState;
            }
            let widgetReps: WidgetRepresentation[] = newWidgets.map((widget, index) => {
                return { widget: widget, position: index };
            });
            this.props.addWidget(widgetReps);
        }
    }

    checkChange(operation: TextOperation, delta: string, start: CharacterLocation, end: CharacterLocation, lastDrop?: DroppedCodeItem, removed: string = ''): boolean {
        if (!lastDrop) { return true; }
        return true;
    }

    // handleToPos(line: CodeMirror.LineHandle): LineLocation {
        
    // }

    componentWillMount() {
        // this.setState((prevState) => {
        //     prevState.widgetComponents[15] = {
        //         type: WidgetType.textbox,
        //         placeholder: "hello"
        //     } as TextboxWidgetState;
        //     return prevState;
        // });
    }

    indexToLoc(doc: CodeMirror.Doc, index: number): CharacterLocation {
        let accumulator = 0;
        
        let line = 0;
        let ch = 0;

        for (let lineNum = 0; lineNum < doc.lineCount(); lineNum++) {
            let lineLength = doc.getLine(lineNum).replace(/\n/g, '').length;
            if (lineLength === 0) continue; // Some lines have nothing in them.

            accumulator += lineLength;
            if (accumulator >= index) {
                accumulator -= lineLength;
                ch = index - accumulator;
                line = lineNum
                break;
            }
        }
        
        return { line,  ch }
    }

    locToIndex(doc: CodeMirror.Doc, loc: CharacterLocation): number {
        let charIndex = 0;
        for (let lineNum = 0; lineNum < loc.line; lineNum++ ) {
            // if (lineNum > loc.line) { break; }
            let line = doc.getLine(lineNum)
            charIndex += line ? line.replace(/\n/g, '').length : 0;
        }
        charIndex += loc.ch;

        return charIndex;
    }

    render() {
        let cm = this.props.cm;
        let doc = cm.getDoc();
        return <div>
            {
                this.props.widgetData.map((widget, char) => {
                    
                    // Every widget has a staring position, but each calculation of the ending position
                    // is different for each widget.
                    let loc = this.indexToLoc(doc, char);
                    let startPosition = cm.charCoords(loc, 'local');

                    switch (widget.type) {
                        case WidgetType.textbox: {
                            let textboxState = widget as TextboxWidgetState;

                            // Calculate the ending position based on either the length of the placeholder
                            // or the length of the actual text.
                            //let endChar = textboxState.enteredText ? textboxState.enteredText.length - 1: textboxState.placeholder.length - 1;
                            let endChar = textboxState.getWidth(textboxState) - 1;
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

const mapDispatchToWidgetContainerProps = (dispatch: Dispatch<CodeEditorState>) => {
    return {
        addWidget: (widgets: WidgetRepresentation[]) => {
            dispatch(Actions.addWidget(widgets));
        },
        removeWidget: (position: number[]) => {
            dispatch(Actions.removeWidget(position));
        },
        moveWidget: (moves: WidgetMove[]) => {
            dispatch(Actions.moveWidget(moves));
        }
    }
}

const mapStateToWidgetContainerProps = (state: ApplicationState) => {
    return {
        currentText: state.codeEditor.currentEnteredCode,
        widgetData: state.codeEditor.widgetData
    };
};

const WidgetContainer = connect(mapStateToWidgetContainerProps, mapDispatchToWidgetContainerProps, null, { withRef: true })(UnconnectedWidgetContainer);

export { TextOperation, WidgetContainer }