class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_user, :logged_in?

	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]

  	# Return this user (session[:user_id]) if session[:user_id] exist (there is a user_id that is 
  	# stored, thats backed by our browser in our session hash. if so find the user in our database
  	# based on that user_id
	end

	def logged_in? #is current_user true? is there a user logged in?
  		!!current_user #convert to boolean. return true if there is current_user or false if there is no current_user
  	end

	def require_user #for certain actions, i want to restricted based  on if there is a logged in user or not
  		if !logged_in?
  			flash[:danger] = "You must be logged in to perform that action"
  			redirect_to root_path
  		end
  	end

end
