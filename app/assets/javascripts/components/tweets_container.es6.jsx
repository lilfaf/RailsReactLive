class TweetsContainer extends React.Component {

  constructor() {
    super();
    this.scrollListener = this.scrollListener.bind(this);

    this.consumer = Cable.createConsumer(`ws://${window.location.host}/websocket`);

    this.state = {
      tweets: [],
      page: 0,
      loading: false
    };
  }

  componentWillMount() {
    this.fetchPage();
    this.setupSubscription();
  }

  componentDidMount() {
    this.attachScrollListener();
  }

  componentDidUpdate() {
    this.attachScrollListener();
  }

  componentWillUnmount() {
    this.detachScrollListener();
    this.tweets.unsubscribe();
  }

  setupSubscription() {
    this.channel = this.consumer.subscriptions.create('TweetsChannel', {
      received: (tweet) => {
        let tweets = this.state.tweets;
        tweets.unshift(tweet);

        this.setState({tweets: tweets});
      }
    });
  }

  fetchPage() {
    if (this.state.loading) return;

    let nextPage = this.state.page + 1;

    $.getJSON(this.props.tweetsPath, {page: nextPage}, (data) => {
      let tweets = this.state.tweets.concat(data);
      // remove duplicated tweets
      tweets = _.uniq(tweets, (tweet) => { return tweet.id; });

      this.setState({tweets: tweets});
    })
    .fail((error) => {
      console.log(error.responseText);
    })
    .always(() => {
      this.setState({loading: false});
    });

    this.setState({loading: true, page: nextPage})
  }

  scrollListener() {
    let el = ReactDOM.findDOMNode(this.refs.tweets);
    if ((el.scrollHeight - el.scrollTop) - el.offsetHeight < 100) {
      this.detachScrollListener();
      this.fetchPage();
    }
  }

  attachScrollListener() {
    this.refs.tweets.addEventListener('scroll', this.scrollListener);
    this.refs.tweets.addEventListener('resize', this.scrollListener);
  }

  detachScrollListener() {
    this.refs.tweets.removeEventListener('scroll', this.scrollListener);
    this.refs.tweets.removeEventListener('resize', this.scrollListener);
  }

  render() {
    return (
      <div className='twt-wrapper'>
        <div className='panel panel-info'>
          <div className='panel-heading'>
            Twitter Live Feed
          </div>
          <div className='panel-body' ref='tweets'>
            <Tweets tweets={this.state.tweets}  />
            <LoadingIndicator loading={this.state.loading} />
          </div>
        </div>
      </div>
    );
  }
}
