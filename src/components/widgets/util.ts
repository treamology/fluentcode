export enum TextOperation {
    insert = 'insert',
    delete = 'delete',
    tbExtend = 'tbExtend'
}
export interface CharacterLocation {
    line: number;
    ch: number;
}
export module CodeMirrorUtils {
    export function indexToLoc(doc: CodeMirror.Doc, index: number): CharacterLocation {
        let accumulator = 0;
        
        let line = 0;
        let ch = 0;

        for (let lineNum = 0; lineNum < doc.lineCount(); lineNum++) {
            let lineLength = doc.getLine(lineNum).replace(/\n/g, '').length;
            if (lineLength === 0) { continue; } // Some lines have nothing in them.

            accumulator += lineLength;
            if (accumulator >= index) {
                accumulator -= lineLength;
                ch = index - accumulator;
                line = lineNum;
                break;
            }
        }
        
        return { line,  ch };
    }

    export function locToIndex(doc: CodeMirror.Doc, loc: CharacterLocation): number {
        let charIndex = 0;
        for (let lineNum = 0; lineNum < loc.line; lineNum++ ) {
            let line = doc.getLine(lineNum);
            charIndex += line ? line.replace(/\n/g, '').length : 0;
        }
        charIndex += loc.ch;

        return charIndex;
    }
}