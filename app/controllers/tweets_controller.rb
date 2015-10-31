class TweetsController < ApplicationController
	before_filter :require_authentication

	def index
		render json: tweets
	end

	private

	def tweets
		[{id: 1, text: 'test'}, {id: 2, text: 'test 2'}]
	end
end
