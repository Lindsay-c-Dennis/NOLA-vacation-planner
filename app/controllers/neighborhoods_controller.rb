class NeighborhoodsController < ApplicationController
	before_action :find_neighborhood, only: [:show, :edit, :update]

	def index
		@neighborhoods = Neighborhood.all 
	end

	def show 
		@landmarks = @neighborhood.landmarks
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
	end 
	
	def update 
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

	def find_neighborhood 
		@neighborhood = Neighborhood.find_by(id: params[:id])	
	end				


end
