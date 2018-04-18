class NeighborhoodsController < ApplicationController

	def index
		@neighborhoods = Neighborhood.all 
	end

	def show 
		@neighborhood = Neighborhood.find_by(id: params[:id])
	end	

	def new
		@neighborhood = Neighborhood.new 
	end 

	def create 
		@neighborhood = Neighborhood.new(neighborhood_params)
		if @neighborhood.save 
			flash[:message] = "Neighborhood successfully created"
			redirect_to neighborhood_path(@neighborhood)
		else 
			render 'new'
		end
	end 

	def edit 
		@neighborhood = Neighborhood.find_by(id: params[:id])
	end 
	
	def update 
		@neighborhood = Neighborhood.find_by(id: params[:id])
		if @neighborhood.update(neighborhood_params)
			flash[:message] = "Neighborhood successfully updated."
			redirect_to neighborhood_path(@neighborhood)
		else 
			render 'edit'
		end 
	end 

	private 

	def neighborhood_params 
		params.require(:neighborhood).permit(:name, :image_link, :description)
	end						


end
