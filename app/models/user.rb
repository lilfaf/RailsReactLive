class User < ActiveRecord::Base
	validates :uid, :token, :secret, presence: true
end
