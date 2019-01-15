import * as React from 'react';
import '../styles/requirementsbar.scss';

interface RequirementCheckboxProps {
    description: string;
    completed: boolean;
}

class RequirementCheckbox extends React.Component<RequirementCheckboxProps> {
    render() {
        let checkboxClassName = 'requirementCheckboxCheckbox';
        if (this.props.completed) {
            checkboxClassName += ' complete';
        }

        return (
            <div className="requirementCheckbox">
                <div className={checkboxClassName} />
                <span className="requirementCheckboxDesc">{this.props.description}</span>
            </div>
        );
    }
}

export default RequirementCheckbox;