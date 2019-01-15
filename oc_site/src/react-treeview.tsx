import * as React from 'react';
// import * as PropTypes from 'prop-types';

interface TreeViewProps {
  collapsed?: boolean;
  defaultCollapsed?: boolean;
  nodeLabel: string;
  className?: string;
  itemClassName?: string;
  childrenClassName?: string;
  treeViewClassName?: string;
  onClick?: Function;
  // tslint:disable-next-line
  arrowImage?: any;
  wantsChildren?: boolean;
}

interface TreeViewState {
  collapsed?: boolean;
}

class TreeView extends React.PureComponent<TreeViewProps, TreeViewState> {

  static defaultProps = {
    collapsed: null,
    className: '',
    itemClassName: '',
    treeViewClassName: '',
    childrenClassName: '',
    wantsChildren: true
  };

  constructor(props: TreeViewProps) {
    super(props);

    this.state = {
      collapsed: this.props.defaultCollapsed
    };
  }

  // tslint:disable-next-line
  handleClick(...args: any[]) {
    this.setState({ collapsed: !this.state.collapsed });
    if (this.props.onClick) {
      this.props.onClick(...args);
    }
  }

  render() {
    let collapsed = this.props.collapsed;
    
    let arrowClassName = 'tree-view_arrow';
    let containerClassName = 'tree-view_children';
    if (collapsed) {
      arrowClassName += ' tree-view_arrow-collapsed';
      containerClassName += ' tree-view_children-collapsed';
    }

    const arrow = (
      <div
        className={this.props.className + ' ' + arrowClassName}
      >
        {this.props.arrowImage ? <img src={this.props.arrowImage}/> : null}
      </div>
    );

    return (
      <div className={'tree-view ' + this.props.treeViewClassName}>
        <div className={'tree-view_item ' + this.props.itemClassName} onClick={() => this.handleClick()}>
          {React.Children.count(this.props.children) === 0 ? null : arrow}
          <span className="tree-view_label">{this.props.nodeLabel}</span>
          {this.props.wantsChildren ? null : this.props.children}
        </div>
        <div className={containerClassName + ' ' + this.props.childrenClassName}>
          {collapsed || !this.props.wantsChildren ? null : this.props.children}
        </div>
      </div>
    );
  }
}

export default TreeView;
