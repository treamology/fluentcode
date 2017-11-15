import * as React from 'react'
import '../App.scss';

let runTriangle = require("../assets/svg/runtriangle.svg")

interface RunBarState {
    
}

class RunBar extends React.Component<any, RunBarState> {
    render() {
        return (
            <div className="runBar">
                <a className="runButtonContainer">
                    <span className="runButtonText">Run</span>
                    <img className="runButtonImage" src={ runTriangle } />
                </a>
            </div>
        );
    }
}

export default RunBar;