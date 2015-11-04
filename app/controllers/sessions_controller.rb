class SessionsController < ApplicationController

  def create
    user = ::Authentication.user_from_auth_hash(auth_hash)
    cookies.signed[:user_id] = user.id
    redirect_to root_path, notice: 'Signed in successfully'
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_path, notice: 'Signed out successfully. Bye bye!'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
