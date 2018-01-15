import * as React from 'react';
import '../styles/requirementsbar.scss';
import { ApplicationState } from '../state/types/state';
import { Actions } from '../state/actions';
import { Section } from '../models';
import { connect } from 'react-redux';
import { Dispatch } from 'redux';
import Store from '../store';

import { PanelHeader } from './smallui';
import RequirementCheckbox from './requirementcheckbox';

interface RequirementsBarProps {
    currentSection: Section;
    requirementsOpen: boolean;
    toggleRequirements: () => void;
    nextSection: () => void;
}

class UnconnectedRequirementsBar extends React.Component<RequirementsBarProps> {

    numReqs: number;
    completedReqs: number;

    render() {
        this.numReqs = 0;
        this.completedReqs = 0;
        let requirementElements;

        if (this.props.currentSection && this.props.currentSection.requirements) {
            this.numReqs = this.props.currentSection.requirements.length;
            requirementElements = this.props.currentSection.requirements.map((requirement, index) => {
                if (requirement.completed) {
                    this.completedReqs += 1;
                }
                return (
                    <RequirementCheckbox
                        description={requirement.description}
                        completed={requirement.completed}
                        key={requirement.description}
                    />
                );
            });
        }

        // CSS State
        let nextSectionClassName = 'nextSectionButton';
        if (this.numReqs !== this.completedReqs) {
            nextSectionClassName += ' disabled';
        }

        let listContainerClassName = 'requirementsListContainer';
        if (!this.props.requirementsOpen) {
            listContainerClassName += ' closed';
        }

        return (
            <div className="requirementsContainer">
                <div className="requirementsBar">
                    <span className="requirementsLabel" onClick={() => this.props.toggleRequirements()}>
                        {this.completedReqs} of {this.numReqs} requirements satisfied
                    </span>
                    <div className="nextSectionContainer">
                        <span className={nextSectionClassName} onClick={this.nextSection.bind(this)}>
                            Complete Section
                        </span>
                    </div>
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

    nextSection() {
        if (this.numReqs === this.completedReqs) {
            this.props.nextSection();
        }
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
        toggleRequirements: () => {
            dispatch(Actions.toggleRequirements());
        },
        nextSection: () => {
            let state = Store.getInstance().getState();
            let currentSection = state.learning.currentSection;
            let currentCourse = state.learning.currentCourse;
            
            if (currentSection && currentCourse) {
                let lessonNum = currentSection.lessonNumber;
                try {
                    // one is already added ( - 1 + 1)
                    let nextSection = currentCourse.lessons[lessonNum - 1].sections[currentSection.number];
                    if (!nextSection) { throw new Error('whoops'); }
                    dispatch(Actions.selectSection(nextSection));
                } catch (e) {
                    try {
                        let nextLesson = currentCourse.lessons[lessonNum]; // one is already added ( - 1 + 1)
                        if (!nextLesson) { throw new Error('whoops'); }
                        dispatch(Actions.selectSection(nextLesson.sections[0]));
                    } catch (e2) { return; }
                }
            }
        }
    };
};

const RequirementsBar = connect(mapStateToProps,  mapDispatchToProps)(UnconnectedRequirementsBar);

export default RequirementsBar;