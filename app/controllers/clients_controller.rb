class ClientsController < ApplicationController
	def index
		@clients = current_user.clients
	end

	def new
		@client = Client.new
	end
end