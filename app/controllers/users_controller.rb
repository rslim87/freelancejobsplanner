class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]

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
	end

	def update
		if @user.update(user_params)
			falsh[:success] = "You have updated your user profile"
			redirect_to user_path(@user)
		else
			redirect_to :edit
		end
	end



	def show
		if current_user != @user
		   flash[:danger] = "You can only see your own page"
		   redirect_to root_path
		end
	end

	

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

	def set_user
		@user = User.find_by_id(params[:id])
	end




end