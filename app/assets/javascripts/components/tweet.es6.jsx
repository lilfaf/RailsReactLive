class Tweet extends React.Component {
	render () {
    return (
	  	<div>
				<h4>{this.props.text}</h4>
			</div>
		);
	}
}

Tweet.propTypes = {
	text: React.PropTypes.string.isRequired,
}
