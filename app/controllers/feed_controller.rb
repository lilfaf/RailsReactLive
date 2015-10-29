class FeedController < ApplicationController
	before_filter :require_login

	def stream
		render json: tweets
  end

	private

	def tweets
		[{id: 1, text: 'test'}, {id: 2, text: 'test 2'}]
	end
end
