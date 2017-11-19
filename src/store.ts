import * as Redux from 'redux';
import thunkMiddleware from 'redux-thunk';
import { ApplicationState } from './state/types';
import ocSite from './state/reducer';

class Store {
    static instance: Redux.Store<ApplicationState>;

    static getInstance(): Redux.Store<ApplicationState> {
        if (Store.instance == null) {
            Store.instance = Redux.createStore(ocSite, Redux.applyMiddleware(thunkMiddleware)) as Redux.Store<ApplicationState>;
        }

        return Store.instance;
    }
}

export default Store;