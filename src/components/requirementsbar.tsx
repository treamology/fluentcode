import * as React from 'react';
import '../styles/requirementsbar.scss';
import { ApplicationState } from '../state/types/state';
import { Actions } from '../state/actions';
import { Section } from '../models';
import { connect } from 'react-redux';
import { Dispatch, AnyAction } from 'redux';

import { PanelHeader } from './smallui';
import RequirementCheckbox from './requirementcheckbox';

interface RequirementsBarProps {
    currentSection: Section;
    requirementsOpen: boolean;
    toggleRequirements: () => AnyAction;
}

class UnconnectedRequirementsBar extends React.Component<RequirementsBarProps> {

    render() {
        let numReqs = 0;
        let completedReqs = 0;

        if (this.props.currentSection && this.props.currentSection.requirements) {
            numReqs = this.props.currentSection.requirements.length
        }

        let requirementElements;
        if (numReqs != 0) {
            requirementElements = this.props.currentSection.requirements.map(requirement => {
                return (
                    <RequirementCheckbox description={requirement.description} completed={false} />
                );
            })
        }

        // CSS State
        let nextSectionClassName = 'nextSectionButton';
        if (numReqs !== completedReqs) {
            nextSectionClassName += ' disabled';
        }

        let listContainerClassName = 'requirementsListContainer';
        if (!this.props.requirementsOpen) {
            listContainerClassName += ' closed';
        }

        return (
            <div className="requirementsContainer">
                <div className="requirementsBar">
                    <span className="requirementsLabel" onClick={() => this.props.toggleRequirements()}>{completedReqs} of {numReqs} requirements satisfied</span>
                    <span className={nextSectionClassName}>Next Section</span>
                </div>
                <div className={listContainerClassName}>
                    <PanelHeader headerText="Requirements" />
                    <div className="requirementsList">
                        {requirementElements}
                    </div>
                </div>
            </div>
        );
    }

}

const mapStateToProps = (state: ApplicationState) => {
    return {
        currentSection: state.learning.currentSection,
        requirementsOpen: state.codeEditor.requirementsOpen
    };
};

const mapDispatchToProps = (dispatch: Dispatch<ApplicationState>) => {
    return {
        toggleRequirements: (section: Section) => {
            dispatch(Actions.toggleRequirements());
        }
    };
};

const RequirementsBar = connect(mapStateToProps,  mapDispatchToProps)(UnconnectedRequirementsBar);

export default RequirementsBar;