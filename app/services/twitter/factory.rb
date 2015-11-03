class Twitter::Factory

  STREAM_CONN_OPTS = {
    tcp_socket_class: Celluloid::IO::TCPSocket,
    ssl_socket_class: Celluloid::IO::SSLSocket
  }

  class << self

    def streaming_client(user)
      Twitter::Streaming::Client.new client_config(user).merge(STREAM_CONN_OPTS)
    end

    def rest_client(user)
      Twitter::REST::Client.new client_config(user)
    end

    def client_config(user)
      {
        consumer_key:        Rails.application.secrets.twitter_api_key,
        consumer_secret:     Rails.application.secrets.twitter_api_secret,
        access_token:        user.token,
        access_token_secret: user.secret
      }
    end
  end
end
