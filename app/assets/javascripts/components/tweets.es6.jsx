class Tweets extends React.Component {
  render () {
    var createTweet = (tweet) => {
      return (
        <li key={tweet.id} className="media">
          <Tweet text={tweet.text} user={tweet.user}/>
        </li>
      );
    };

    return (
      <ul className="media-list">
        { this.props.tweets.map(createTweet) }
      </ul>
    );
  }
}
