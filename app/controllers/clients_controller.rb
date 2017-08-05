class ClientsController < ApplicationController
	before_action :set_client, only: [:show, :destroy, :edit, :update]
	before_action :require_same_user, except: [:new, :index, :create, :borough]
	before_action :require_login, only: [:new, :index, :create]

	def index
		@clients = current_user.clients
	end

	def new
		@client = Client.new
	end

	def create
		@client = current_user.clients.build(client_params)
		if @client.save
			redirect_to client_path(@client)
		else

			redirect_to new_client_path
		end
	end

	def show
		respond_to do |format|
			format.html { render :show }
			format.json { render json: @client }
		end
		
	end


	def destroy
		@client.destroy
		redirect_to clients_path
	end

	def edit
	end

	def update
		if @client.update(client_params)
			redirect_to client_path(@client)
		else
			flash[:danger] = "couldn't update client"
			redirect_to edit_client_path(@client)
		end
	end

	def borough
		@borough_sorted = current_user.clients.sort_by_borough	
	end


	private

	def client_params
		params.require(:client).permit(:fullname, :street, :apt, :borough, :notes)
	end

	def set_client
		@client = Client.find_by_id(params[:id])
	end

	def require_same_user
		if current_user != @client.user
			flash[:danger] = "You are not the user that are associated with this page. Only logged in and associated user can see this page."
			redirect_to root_path
		end
	end

	def require_login
		if !logged_in?
			flash[:danger] = "You need to be logged in to see this page"
			redirect_to login_path
		end
	end

end

