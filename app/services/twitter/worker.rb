class Twitter::Worker
  include Celluloid::IO

  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client = Twitter::Factory.streaming_client(user)
  end

  def run
    async.user_stream
  end

  private

  def user_stream
    client.user do |object|
      if object.is_a?(Twitter::Tweet)
        ActionCable.server.broadcast("tweets_#{user.id}", object)
      end
    end
  end
end
