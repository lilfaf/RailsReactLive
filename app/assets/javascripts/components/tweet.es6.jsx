class Tweet extends React.Component {
  render () {
    return (
      <div>
        <img src={this.props.avatar} className='img-circle pull-left' />
        <h4>{this.props.text}</h4>
      </div>
    );
  }
}

Tweet.propTypes = {
  text: React.PropTypes.string.isRequired,
  avatar: React.PropTypes.string.isRequired
}
