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

// For testing.
let initialState: ApplicationState = { visibleCodeBlocks: 
  [{codeTitleText: 'if', 
  nonCodeTitleText: 'statement', 
  descriptionText: 'Something about an if statement.'}]};

let store: Store<ApplicationState> = createStore(ocSite, initialState);

ReactDOM.render(
  <Provider store={store}>
    <OCSite />
  </Provider>,
  document.getElementById('root') as HTMLElement
);
registerServiceWorker();
