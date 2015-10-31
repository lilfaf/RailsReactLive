class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	private

	def current_user
		@current_user ||= if cookies.has_key? :user_id
												User.find_by_id cookies.signed[:user_id]
											end
	end
	helper_method :current_user

	def require_authentication
		unless current_user
			redirect_to login_path, alert: 'You must login with twitter!'
		end
	end
end
