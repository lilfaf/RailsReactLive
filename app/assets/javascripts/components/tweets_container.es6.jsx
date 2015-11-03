function topPosition(domElt) {
  if (!domElt) {
    return 0;
  }
  return domElt.offsetTop + topPosition(domElt.offsetParent);
}

function getScrollTop() {
  if (window.pageYOffset !== undefined) {
    return window.pageYOffset;
  } else {
    return (document.documentElement || document.body.parentNode || document.body).scrollTop;
  }
}

class TweetsContainer extends React.Component {

  constructor() {
    super();

    this.scrollListener = this.scrollListener.bind(this);

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
    App.tweets.unsubscribe();
  }

  setupSubscription() {
    App.tweets = App.cable.subscriptions.create('TweetsChannel', {
      connected: function() {
        console.log("connected to tweets channel");
      },
      received: (tweet) => {
        let tweets = this.state.tweets;
        tweets.unshift(tweet);

        this.setState({tweets: tweets});
      }
    });
  }

  fetchPage() {
    if (this.state.loading) return;

    this.setState({
      loading: true,
      page: this.state.page + 1
    },
    () => {
      $.getJSON(
        this.props.tweetsPath,
        {page: this.state.page},
        (data) => {
          let tweets = this.state.tweets;
          data.map((tweet) => {
            if (tweets.indexOf(tweet) == -1) tweets.push(tweet);
          });

          this.setState({tweets: tweets});
        }
      )
      .fail((error) => {
        console.log(`Error occurred when loading tweets: ${error.responseText}`);
      })
      .always(() => {
        this.setState({loading: false});
      });
    });
  }

  scrollListener() {
    let el = ReactDOM.findDOMNode(this);
    if (topPosition(el) + el.offsetHeight - getScrollTop() - window.innerHeight < 100) {
      this.detachScrollListener();
      this.fetchPage();
    }
  }

  attachScrollListener() {
    window.addEventListener('scroll', this.scrollListener);
    window.addEventListener('resize', this.scrollListener);
  }

  detachScrollListener() {
    window.removeEventListener('scroll', this.scrollListener);
    window.removeEventListener('resize', this.scrollListener);
  }

  render() {
    return (
      <div>
        <Tweets tweets={this.state.tweets} />
        <LoadingIndicator loading={this.state.loading} />
      </div>
    );
  }
}
