import Store from './store';

export const PROTO = 'http://';
export const ROOT = 'localhost:8000/api';

export const API_KEY_ENDPOINT = '/get_auth_token';
export const CODE_EXECUTE_ENDPOINT = '/code/execute';

export function callAPI(endpoint: string, method: string, body: string = ''): Promise<{}> {
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

    if (method !== 'GET') {
        request.body = body;
    }

    return fetch(`${PROTO}${ROOT}${endpoint}`, request);
}