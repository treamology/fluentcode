import * as React from 'react';
import '../../styles/editor.scss';

export interface TextBoxDimensions {
    x: number;
    y: number;
    width: number;
    height: number;
}

export interface TextBoxProps {
    absDimensions: TextBoxDimensions;
    placeholderText: string;
    onChange: (text: string) => void;
}

export default class TextBoxWidget extends React.Component<TextBoxProps, {}> {
    constructor(props: TextBoxProps) {
        super(props);
        this.textChange = this.textChange.bind(this);
    }

    render() {

        if (!this.props.absDimensions) {
            return <input />;
        }
        const style = {
            left: this.props.absDimensions.x,
            top: this.props.absDimensions.y,
            width: this.props.absDimensions.width,
            height: this.props.absDimensions.height,
        };

        return (
        <input
            style={style}
            className="textboxWidget"
            placeholder={this.props.placeholderText}
            onChange={this.textChange}
        />
        );
    }

    textChange(event: React.FormEvent<HTMLInputElement>) {
        this.props.onChange(event.currentTarget.value);
    }
}