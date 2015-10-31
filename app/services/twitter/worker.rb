class Twitter::Worker
  include Celluloid::IO

	attr_reader :client, :user

	STREAM_CONN_OPTS = {
		tcp_socket_class: Celluloid::IO::TCPSocket,
		ssl_socket_class: Celluloid::IO::SSLSocket
	}

	def initialize(user)
		@user = user
		@client = Twitter::Streaming::Client.new(STREAM_CONN_OPTS) do |config|
		  config.consumer_key        = Rails.application.secrets.twitter_api_key
		  config.consumer_secret     = Rails.application.secrets.twitter_api_secret
		  config.access_token        = user.token
		  config.access_token_secret = user.secret
		end
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
