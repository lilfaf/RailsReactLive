class Tweet extends React.Component {
  render () {
    return (
      <div>
        <div className="media-left">
          <a href="#">
            <img className='img-circle media-object'
                 src={this.props.user.profile_image_url.replace('normal', 'bigger')} />
          </a>
        </div>
        <div className="media-body">
          <h5 className="media-heading">
            {this.props.user.name}
            <small> @{this.props.user.screen_name}</small>
          </h5>
          <p>{this.props.text}</p>
        </div>
      </div>
    );
  }
}

Tweet.propTypes = {
  text: React.PropTypes.string.isRequired,
  user: React.PropTypes.object.isRequired,
}
