class ClientsController < ApplicationController
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
		@client = Client.find_by_id(params[:id])
	end


	def destroy
		@client = Client.find_by_id(params[:id])
		@client.destroy
		redirect_to clients_path
	end

	def edit
		@client = Client.find_by_id(params[:id])
	end

	def update
		@client = Client.find_by_id(params[:id])
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

end

