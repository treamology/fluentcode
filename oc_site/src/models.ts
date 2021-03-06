export interface CourseListing {
    id: number;
    name: string;
}

export interface Course extends CourseListing {
    author: string;
    lessons: Lesson[];
    draggables: DraggableData[];
}

export function draggableByID(id: number, draggables: DraggableData[]) {
    for (let draggable of draggables) {
        if (draggable.id === id) {
            return draggable;
        }
    }
    return null;
}

export interface DraggableData {
    id: number;
    codeName: string;
    descName: string;
    descText: string;
    code: string;
    textFields: DraggableTextField[];
}

export interface DraggableTextField {
    id: number;
    startChar: number;
    endChar: number;
    lineNumber: number;
    placeholderText: string;
    currentText: string;
}

export interface Lesson {
    id: number;
    name: string;
    number: number;
    sections: Section[];
}

export interface Section {
    id: number;
    name: string;
    number: number;
    text: string;
    draggables: number[];
    requirements: SectionRequirement[];
    lessonNumber: number;
    completed: boolean;
}

export interface SectionRequirement {
    description: string;
    completed: boolean;
}

export interface TestResult {
    success: boolean;
    out: string;
    err: string;
}