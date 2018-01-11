import Store from './store';

// export const PROTO = 'http://';
export const ROOT = window.location.origin + '/api';

export const HEARTBEAT_ENDPOINT = '/heartbeat';
export const API_KEY_ENDPOINT = '/get_auth_token';
export const CODE_EXECUTE_ENDPOINT = '/code/execute';
export const COURSE_LIST_ENDPOINT = '/learn/courses/list';
export const COURSE_DETAIL_ENDPOINT = '/learn/courses/detail';
export const LESSON_DETAIL_ENDPOINT = '/learn/lessons/detail';
export const SECTION_DETAIL_ENDPOINT = '/learn/sections/detail';

export function callAPI(endpoint: string, method: string, body: string = ''): Promise<{}> {
    let root = ROOT
    if (process.env.NODE_ENV !== 'production') {
        root = 'http://' + window.location.hostname + ':8000/api'
    }

    let headers = new Headers({
        'Content-Type': 'application/json',
    });

    if (Store.getInstance().getState().apiKey !== '') {
        let apiKey = Store.getInstance().getState().apiKey;
        headers.append('Authorization', `Token ${apiKey}`);
    }
    
    let request: RequestInit = {
        method: method,
        mode: 'cors',
        headers: headers
    };

    let query = '';
    if (method === 'GET') {
        query = body;
    } else {
        request.body = body;
    }
    
    return fetch(`${root}${endpoint}?${query}`, request);
}

export function handleAPIFailure(error: Error) {
    throw error;
}