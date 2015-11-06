class TweetsChannel < ApplicationCable::Channel
  def subscribed
    @streamer = Tweetter::Supervisor.new current_user
    @streamer.run

    stream_from "tweets_user_#{current_user.id}"
  end

  def unsubscribed
    @streamer.terminate
  end
end
