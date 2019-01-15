import * as React from 'react';
import '../styles/header.scss';

let logoImage = require('../assets/svg/logo.svg');

class Header extends React.Component {
    render() {
        return (
            <div className="header">
                <object className="logo" type="image/svg+xml" data={logoImage} />
                <a href="/feedback" target="_blank" className="feedbackButton">Feedback</a>
            </div>
        );
    }
}

export default Header;