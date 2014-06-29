class ClientsController < ApplicationController
	def index
		@clients = Client.all
	end

	def new
	  	@client = Client.new
	end

	def create
  		@client = Client.new(client_params)
  		if @client.save
  			redirect_to @client
  		else
  			render "new"
  		end
	end

	def show
	  	@client = Client.find(params[:id])
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(params[:client].permit(:name, :email, :telephone, :street, :zip_code, :city, :country))
		  redirect_to clients_url
		else
		  render "edit"
		end
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy

		redirect_to clients_url
	end

	private
	  	def client_params
	  		params.require(:client).permit(:name, :email, :telephone, :street, :zip_code, :city, :country)
	  	end
end
