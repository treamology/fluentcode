import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { Store } from 'redux';
import OCSite from './OCSite';
import registerServiceWorker from './registerServiceWorker';
import './index.css';

import { createStore } from 'redux';
import ocSite from './state/reducer';
import { ApplicationState } from './state/types';

let store: Store<ApplicationState> = createStore(ocSite);

ReactDOM.render(
    <Provider store={store}>
      <OCSite />
    </Provider>,
    document.getElementById('root') as HTMLElement
);
registerServiceWorker();
