import * as React from 'react';
import * as ReactDOM from 'react-dom';
import OCSite from './OCSite';
import registerServiceWorker from './registerServiceWorker';
import './index.css';

ReactDOM.render(
  <OCSite />,
  document.getElementById('root') as HTMLElement
);
registerServiceWorker();
