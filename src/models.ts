export interface CourseListing {
    id: number;
    name: string;
}

export interface Course extends CourseListing {
    author: string;
    lessons: Lesson;
}

export interface Lesson {
    id: number;
    num: number;
    course: Course;
    name: string;
}

export interface Section {
    id: number;
    num: number;
    lesson: Lesson;
    name: string;
    draggables: CodeBlock[];
}

export interface CodeBlock {
    id: number;
    codeTitleText: string;
    nonCodeTitleText: string;
    descriptionText: string;
    droppedCode: string;
}