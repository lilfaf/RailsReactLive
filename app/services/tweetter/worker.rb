class Tweetter::Worker
  include Celluloid::IO
  include Celluloid::Logger

  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client = Tweetter::Factory.streaming_client(user)
  end

  def run
    async.user_stream
  end

  private

  def user_stream
    client.user do |object|
      case object
      when Twitter::Tweet
        ActionCable.server.broadcast("tweets_user_#{user.id}", object)
      when Twitter::Streaming::StallWarning
        warn object.message
      end
    end
  end
end
