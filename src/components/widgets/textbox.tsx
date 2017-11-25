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
}

export default class TextBoxWidget extends React.Component<TextBoxProps, {}> {
    render() {

        if (!this.props.absDimensions) {
            return <input />
        }
        const style = {
            left: this.props.absDimensions.x,
            top: this.props.absDimensions.y,
            width: this.props.absDimensions.width,
            height: this.props.absDimensions.height,
            backgroundColor: "white",
        }
        return <input style={style} className="textboxWidget" />
    }
}