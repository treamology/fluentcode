import * as React from 'react';
import { ApplicationState } from '../state/types/state';
import { Section } from '../models';
import { connect } from 'react-redux';
import * as ReactMarkdown from 'react-markdown';

import '../styles/currentsection.scss';

interface CurrentSectionProps {
    currentSection: Section;
}

class UnconnectedCurrentSectionContainer extends React.Component<CurrentSectionProps> {
    render() {
        let sectionText = '';
        if (this.props.currentSection) {
            sectionText = this.props.currentSection.text;
        }

        return (
            <div className="currentSectionContainer">
                <ReactMarkdown className="sectionText" source={sectionText} />
            </div>
        );
    }
}

const mapStateToProps = (state: ApplicationState) => {
    return {
        currentSection: state.learning.currentSection
    };
};

const ConnectedCurrentSectionContainer = connect(mapStateToProps)(UnconnectedCurrentSectionContainer);

export default ConnectedCurrentSectionContainer;