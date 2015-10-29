class SessionsController < ApplicationController

	def create
		user = ::Authentication.user_from_auth_hash(auth_hash)
		session[:user_id] = user.id
		redirect_to root_path, notice: 'Signed in successfully'
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: 'Signed out successfully. Bye bye!'
	end

	private

	def auth_hash
    request.env['omniauth.auth']
	end
end
