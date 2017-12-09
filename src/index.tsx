import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import OCSite from './OCSite';
import registerServiceWorker from './registerServiceWorker';
import './index.css';

import Store from './store';
import * as Redux from 'redux';

import { ApplicationState } from './state/types/state';
const store: Redux.Store<ApplicationState> = Store.getInstance();

ReactDOM.render(
    <Provider store={store}>
      <OCSite />
    </Provider>,
    document.getElementById('root') as HTMLElement
);
registerServiceWorker();