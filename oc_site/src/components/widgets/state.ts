// Type information gets stripped when compiled to regular javascript :(
export enum WidgetType {
    textbox = 'textbox',
}

// Higher-level state information (not presentation related) for widgets.
export interface WidgetState<> {
    type: WidgetType;
    getWidth: (widget: WidgetState) => number;
}
export interface TextboxWidgetState extends WidgetState {
    enteredText: string;
    placeholder: string;
    onChange: (value: string) => void;
}