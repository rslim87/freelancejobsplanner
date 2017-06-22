class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_user, :logged_in?

	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	# Return this user (session[:user_id]) if session[:user_id] exist (there is a user_id that is 
  	# stored, thats backed by our browser in our session hash. if so find the user in our database
  	# based on that user_id
	end

end
