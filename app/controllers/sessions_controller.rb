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

end