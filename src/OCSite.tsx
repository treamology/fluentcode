import * as React from 'react';
import './App.scss';

import Header from './components/header';
import SidebarLeft from './components/sidebar_left';
import SidebarRight from './components/sidebar_right';
import OutputPanel from './components/output_panel';
import CodeEditor from './components/code_editor';

class OCSite extends React.Component {
  render() {
    return (
      <div className="gridContainer">
        <Header />
        <CodeEditor />
        <SidebarLeft />
        <SidebarRight />
        <OutputPanel />
      </div>
    );
  }

  componentWillMount() {
    
  }
}

export default OCSite;
