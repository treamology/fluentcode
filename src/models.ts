export interface CourseListing {
    id: number;
    name: string;
}

export interface Course extends CourseListing {
    author: string;
    lessons: Lesson[];
    draggables: DraggableData[];
}

export interface DraggableData {
    id: number;
    codeName: string;
    descName: string;
    descText: string;
    code: string;
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
}

export interface SectionRequirement {
    description: string;
}