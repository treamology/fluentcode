import * as React from 'react';
import '../styles/requirementsbar.scss';
import { ApplicationState } from '../state/types/state';
import { Section } from '../models';
import { connect } from 'react-redux';

interface RequirementsBarProps {
    currentSection: Section;
}

class UnconnectedRequirementsBar extends React.Component<RequirementsBarProps> {

    render() {
        let numReqs = 0;
        let completedReqs = 1;

        if (this.props.currentSection && this.props.currentSection.requirements) {
            numReqs = this.props.currentSection.requirements.length
        }

        let nextSectionClassName = 'nextSectionButton';
        if (numReqs !== completedReqs) {
            nextSectionClassName += ' disabled';
        }

        return (
            <div className="requirementsBar">
                <span className="requirementsLabel">{completedReqs} of {numReqs} requirements satisfied</span>
                <span className={nextSectionClassName}>Next Section</span>
            </div>
        );
    }

}

const mapStateToProps = (state: ApplicationState) => {
    return {
        currentSection: state.learning.currentSection
    };
};

const RequirementsBar = connect(mapStateToProps)(UnconnectedRequirementsBar);

export default RequirementsBar;