class LoadingIndicator extends React.Component {

	constructor() {
	  super();
		this.props = {loading: false}
	}

  render() {
	  return (
	    <div className={this.props.loading ? 'text-center' : 'hidden'}>
        <i className="fa fa-spinner fa-spin fa-2x"></i>
		  </div>
	  );
	}
}
