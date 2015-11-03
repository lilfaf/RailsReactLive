require_dependency "#{Rails.root}/app/services/twitter/factory"

class TweetsController < ApplicationController
  before_filter :require_authentication

  def index
    client = Twitter::Factory.rest_client(current_user)
    tweets = client.home_timeline page: params[:page]
    render json: tweets
  rescue Twitter::Error::TooManyRequests => e
    render text: e.message, status: 429
  end
end
