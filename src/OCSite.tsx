import * as React from 'react';
import './App.css';

import Header from './components/header';
import SidebarLeft from './components/sidebar_left';
import SidebarRight from './components/sidebar_right';
import OutputPanel from './components/output_panel';

class OCSite extends React.Component {
  render() {
    return (
      <div className="gridContainer">
        <Header />
        <SidebarLeft />
        <SidebarRight />
        <OutputPanel />
      </div>
    );
  }
}

export default OCSite;
