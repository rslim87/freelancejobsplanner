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

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			redirect_to edit_user_path(@user)
		end
	end



	def show
		@user = User.find_by_id(params[:id])
		if current_user != @user
		   flash[:danger] = "You can only see your own page"
		   redirect_to root_path
		end
	end

	

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end



end