class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome"
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end