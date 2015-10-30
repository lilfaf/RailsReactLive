module Client
	def self.stream_client_for(user)
		Twitter::Streaming::Client.new do |config|
			config.consumer_key        = Rails.application.secrets.twitter_api_key
			config.consumer_secret     = Rails.application.secrets.twitter_api_secret
			config.access_token        = user.token
			config.access_token_secret = user.secret
		end
	end
end
