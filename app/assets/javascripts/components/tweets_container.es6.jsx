class TweetsContainer extends React.Component {

	constructor() {
		super();
		this.state = {tweets: []};
	}

	componentWillMount() {
		this.fetchTweets();
	}

	fetchTweets () {
		$.getJSON(
			this.props.tweetsPath,
			(data) => {
				this.setState({tweets: data});
			}
		);
	}

	render () {
		return (
			<div>
				<Tweets tweets={this.state.tweets} />
			</div>
		);
	}
}
