class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(@user)
		else
			flash[:danger] = "There was something wrong with your login information"
			redirect_to login_path
		end
	end

	def google
		user = User.create_with_omniauth(request.env["omniauth.auth"])
    	session[:user_id] = user.id
    	redirect_to root_path
	end



	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

end