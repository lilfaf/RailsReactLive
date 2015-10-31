class TweetsContainer extends React.Component {

	constructor() {
		super();
		this.state = {tweets: []};
	}

	componentWillMount() {
		this.fetchTweets();
		this.setupSubscription();
	}

	componentWillUnmount() {
	  App.tweets.unsubscribe();
	}

	setupSubscription() {
		App.tweets = App.cable.subscriptions.create('TweetsChannel', {
		  connected: function() {
				console.log("User connected to tweets channel");
			},
			received: (data) => {
				console.log(data);

				tweets = this.state.tweets
				tweets.unshift({
				  id: data.id,
					text: data.text
				});

				this.setState({tweets: tweets})
			}
	  });
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
