import * as React from 'react';
import { CodeMirrorUtils } from './util';
import { ApplicationState, CodeEditorState } from '../../state/types/state';
import { WidgetRepresentation, WidgetMove } from '../../state/types/actions';
import { Actions } from '../../state/actions';
import { connect } from 'react-redux';
import { Dispatch } from 'redux';
import { DroppedCodeItem } from '../draggable';
import { WidgetState, WidgetType, TextboxWidgetState } from './state';
import { TextOperation, CharacterLocation } from './util';

const indexToLoc = CodeMirrorUtils.indexToLoc;
const locToIndex = CodeMirrorUtils.locToIndex;

// Required base attributes for any widget component.
interface WidgetComponentProps {
    style: {};
    startChar: number;
}

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

    textChange(event: React.FormEvent<HTMLInputElement>) {
        if (this.props.onChange) {
            this.props.onChange(event.currentTarget.value);
        }
    }
    
    render() {
        return (
            <input
                style={this.props.style}
                className="textboxWidget"
                placeholder={this.props.placeholder}
                onChange={this.textChange}
            />
        );
    }
}

interface WidgetContainerProps {
    cm: CodeMirror.Editor;
    currentText: string;
    widgetData: WidgetState[];
    addWidget: (widgets: WidgetRepresentation[]) => void;
    removeWidget: (position: number[]) => void;
    moveWidget: (moves: WidgetMove[]) => void;
    updateTextboxWidgetText: (index: number, text: string) => void;
}
export class UnconnectedWidgetContainer extends React.Component<WidgetContainerProps> {

    tbExtendDelLength = 0;

    constructor(props: WidgetContainerProps) {
        super(props);
    }

    textChanged(
        operation: TextOperation,
        delta: string,
        start: CharacterLocation,
        end: CharacterLocation,
        lastDrop?: DroppedCodeItem,
        removed: string = ''
    ) {
        let replaceText = '';
        let replaceFrom;
        let replaceTo;

        let startIndex = locToIndex(this.props.cm.getDoc(), start);
        let endIndex = locToIndex(this.props.cm.getDoc(), end);

        if (operation !== TextOperation.tbExtend) {
            let removalList: number[] = [];
            // If the start of the selection or character insertion goes inside a widget,
            // but doesn't necessarily hit the start character
            for (let index = startIndex; index >= 0; --index) {
                if (!this.props.widgetData[index]) { continue; }

                let widget = this.props.widgetData[index];
                let widgetEnd = index + widget.getWidth(widget);

                if (startIndex < widgetEnd) {
                    removalList.push(index);

                    replaceFrom = indexToLoc(this.props.cm.getDoc(), index);
                    replaceTo = indexToLoc(this.props.cm.getDoc(), widgetEnd - 1);
                    replaceText = delta;
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
                if (index <= startIndex) { return; }

                moves.push({ from: index, to: index + insertLength - removeLength });
            });

            this.props.moveWidget(moves);
        } else {
            // When extending a textox, the existing underlying text is deleted, then it comes through again
            // to insert the new underlying text. I account for that here by storing the removal length for later,
            // and using that to calculate the amount I need to move the boxes.
            if (removed !== '') {
                this.tbExtendDelLength = removed.length;
                return;
            }

            // The widgets are being moved in the same way as above, just calculating the change differently.
            let moves: WidgetMove[] = [];
            this.props.widgetData.forEach((widget, index) => {
                if (index <= startIndex) { return; }

                moves.push({ from: index, to: index + (delta.length - this.tbExtendDelLength) });
            });

            this.props.moveWidget(moves);
            return;
        }

        if (operation === TextOperation.insert && lastDrop) {
            // TODO: right now this is constrained to just textboxes, we need to update DroppedCodeItem
            // Create a list of the next widgets, then update the state with them.
            let newWidgets: WidgetState[] = [];
            for (let field of lastDrop.textFields) {
                let line = start.line + field.lineNumber;
                let char = start.ch + field.startChar;
                let index = locToIndex(this.props.cm.getDoc(), { line, ch: char });
                newWidgets[index] = {
                    type: WidgetType.textbox,
                    placeholder: field.placeholderText,
                    getWidth: (widget: TextboxWidgetState) =>
                        widget.enteredText && widget.enteredText.length > widget.placeholder.length ?
                            widget.enteredText.length : widget.placeholder.length
                } as TextboxWidgetState;
                    
            }
            let widgetReps: WidgetRepresentation[] = newWidgets.map((widget, index) => {
                return { widget: widget, position: index };
            });
            this.props.addWidget(widgetReps);
        }

        if (replaceFrom) {
            this.props.cm.getDoc().replaceRange(replaceText, replaceFrom, replaceTo);
        }
    }

    checkChange(
        operation: TextOperation,
        delta: string,
        start: CharacterLocation,
        end: CharacterLocation,
        lastDrop?: DroppedCodeItem,
        removed: string = ''
    ): boolean {
        let startIndex = locToIndex(this.props.cm.getDoc(), start);
        let endIndex = locToIndex(this.props.cm.getDoc(), end);

        if (lastDrop) {
            for (let index = 0; index < this.props.cm.getDoc().getLine(start.line).length; index++) {
                if (this.props.widgetData[locToIndex(this.props.cm.getDoc(), { line: start.line, ch: index })]) {
                    return false;
                }
            }
        }

        // Make sure text under the widget itself can't be modified
        for (let index = startIndex; index >= 0; --index) {
            if (!this.props.widgetData[index]) { continue; }

            let widget = this.props.widgetData[index];
            let widgetEnd = index + widget.getWidth(widget);
            
            return (startIndex === index && operation === TextOperation.delete) || 
                (startIndex === widgetEnd - 1 && endIndex - startIndex === 1) || 
                startIndex >= widgetEnd;
        }

        return true;
    }

    render() {
        let cm = this.props.cm;
        let doc = cm.getDoc();
        return (
        <div>
            {
                this.props.widgetData.map((widget, char) => {
                    
                    // Every widget has a staring position, but each calculation of the ending position
                    // is different for each widget.
                    let loc = indexToLoc(doc, char);
                    let startPosition = cm.charCoords(loc, 'local');

                    switch (widget.type) {
                        case WidgetType.textbox: {
                            let textboxState = widget as TextboxWidgetState;

                            // Calculate the ending position based on either the length of the placeholder
                            // or the length of the actual text.
                            let endChar = textboxState.getWidth(textboxState) - 1;
                            let endLoc = { line: loc.line, ch: loc.ch + endChar };
                            let endPosition = cm.charCoords(endLoc, 'local');

                            const style = {
                                left: startPosition.left,
                                top: startPosition.top + 1,
                                width: endPosition.right - startPosition.left,
                                height: endPosition.bottom - endPosition.top - 1 // So the border doesn't get cut off
                            };

                            const tbChange = (value: string) => {
                                let prevValue = textboxState.enteredText;
                                this.props.updateTextboxWidgetText(char, value);
                                
                                // Handle width adjustment of textbox and editing underlying editor text.
                                if (textboxState.enteredText.length >= textboxState.placeholder.length) {
                                    doc.replaceRange('', loc, { line: endLoc.line, ch: endLoc.ch + 1 }, '+tbExtend');
                                    doc.replaceRange(textboxState.enteredText, loc, undefined, '+tbExtend');
                                } else if (prevValue && prevValue.length > textboxState.placeholder.length) {
                                    doc.replaceRange('', loc,
                                        { line: endLoc.line, ch: loc.ch + prevValue.length }, '+tbExtend');
                                    doc.replaceRange(textboxState.placeholder, loc, undefined, '+tbExtend');
                                }

                                if (textboxState.onChange) {
                                    textboxState.onChange(value);
                                }
                            };

                            return (
                                <TextboxWidgetComponent
                                    style={style}
                                    placeholder={textboxState.placeholder}
                                    enteredText={textboxState.enteredText}
                                    startChar={char}
                                    key={char}
                                    onChange={tbChange}
                                />
                            );
                        }
                        default: return;
                    }
                })
            }
        </div>
        );
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
        },
        updateTextboxWidgetText: (index: number, text: string) => {
            dispatch(Actions.updateTextboxWidgetText(text, index));
        }
    };
};

const mapStateToWidgetContainerProps = (state: ApplicationState) => {
    return {
        currentText: state.codeEditor.currentEnteredCode,
        widgetData: state.codeEditor.widgetData
    };
};

export const WidgetContainer = connect(
    mapStateToWidgetContainerProps,
    mapDispatchToWidgetContainerProps,
    null,
    { withRef: true }
)(UnconnectedWidgetContainer);