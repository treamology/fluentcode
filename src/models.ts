export interface CourseListing {
    id: number;
    name: string;
}

export interface Course extends CourseListing {
    author: string;
    lessons: Lesson[];
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
    // lesson: Lesson;
    
    //draggables: CodeBlock[];
}

export interface CodeBlock {
    id: number;
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
    droppedCode: string;
}