class Tweets extends React.Component {
  render () {
    var createTweet = (tweet) => {
      return (
        <li key={tweet.id} className="list-group-item">
          <Tweet text={tweet.text} avatar={tweet.user.profile_image_url}/>
        </li>
      );
    };

    return (
      <ul className="list-group">
        { this.props.tweets.map(createTweet) }
      </ul>
    );
  }
}
