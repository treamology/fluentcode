import * as React from 'react';
import { ApplicationState } from '../state/types/state';
import { Dispatch } from 'redux';
import { Actions, AsyncActions } from '../state/actions';
import { connect } from 'react-redux';
import '../styles/inputbox.scss';

interface UnconnectedInputBoxProps {
    rerunCode: (input: string) => void;
}

interface UnconnectedInputBoxState {
    currentInput: string;
}

class UnconnectedInputBox extends React.Component<UnconnectedInputBoxProps, UnconnectedInputBoxState> {
    constructor(props: UnconnectedInputBoxProps) {
        super(props);

        this.state = {
            currentInput: ''
        };

        this.continueButtonClicked = this.continueButtonClicked.bind(this);
        this.inputTyped = this.inputTyped.bind(this);
    }

    render() {
        return (
            <div className="inputBoxContainer">
                <input placeholder="User Input:" className="inputTextbox" onChange={this.inputTyped}/>
                <span className="continueButton" onClick={this.continueButtonClicked}>Continue</span>
                <div className="separator" />
            </div>
        );
    }

    inputTyped(event: React.FormEvent<HTMLInputElement>) {
        this.setState({
            currentInput: event.currentTarget.value
        });
    }

    continueButtonClicked() {
        this.props.rerunCode(this.state.currentInput);

        this.setState({
            currentInput: ''
        });
    }
}

const mapDispatchToProps = (dispatch: Dispatch<ApplicationState>) => {
    return {
        rerunCode: (input: string) => {
            dispatch(Actions.updateInputs(input));
            dispatch(AsyncActions.runCode());
        }
    };
};

const InputBox = connect(null, mapDispatchToProps)(UnconnectedInputBox);
export default InputBox;