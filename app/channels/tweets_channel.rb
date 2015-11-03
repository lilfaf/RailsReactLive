class TweetsChannel < ApplicationCable::Channel
  def subscribed
    puts "#{current_user.name} subscribed to tweets channel"
    @streamer = Twitter::Worker.new(current_user)
    @streamer.run

    stream_from "tweets_#{current_user.id}"
  end

  def unsubscribed
    puts "#{current_user.name} unsubscribed from tweets channel"
    @streamer.terminate
  end
end
