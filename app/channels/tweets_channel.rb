class TweetsChannel < ApplicationCable::Channel
	def stream
		stop_all_streams
		stream_from "tweets:#{data['uid'].to_i}"
	end
end
