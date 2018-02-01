import * as React from 'react';
import '../styles/header.scss';

class Header extends React.Component {
    render() {
        return (
            <div className="header">
                <a href="/feedback" target="_blank" className="feedbackButton">Tester Feedback</a>
            </div>
        );
    }
}

export default Header;