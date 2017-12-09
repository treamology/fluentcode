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
  arrowImage: any;
}

interface TreeViewState {
  collapsed: boolean;
}

class TreeView extends React.PureComponent<TreeViewProps, TreeViewState> {

  static defaultProps = {
    collapsed: true,
    className: '',
    itemClassName: '',
    treeViewClassName: '',
    childrenClassName: ''
  };

  constructor(props: TreeViewProps) {
    super(props);

    this.state = {
      collapsed: true
    };
    this.handleClick = this.handleClick.bind(this);
  }

  // tslint:disable-next-line
  handleClick(...args: any[]) {
    this.setState({ collapsed: !this.state.collapsed });
    if (this.props.onClick) {
      this.props.onClick(...args);
    }
  }

  render() {
    let collapsed = this.state.collapsed;

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
        <img src={this.props.arrowImage}/>
      </div>
    );

    return (
      <div className={'tree-view ' + this.props.treeViewClassName}>
        <div className={'tree-view_item ' + this.props.itemClassName} onClick={this.handleClick}>
          {React.Children.count(this.props.children) === 0 ? null : arrow}
          {this.props.nodeLabel}
        </div>
        <div className={containerClassName + ' ' + this.props.childrenClassName}>
          {collapsed ? null : this.props.children}
        </div>
      </div>
    );
  }
}

export default TreeView;
