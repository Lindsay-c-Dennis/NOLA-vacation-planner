class LandmarksController < ApplicationController

	def index
		@landmarks = Landmark.all
	end

	def new
		@landmark = Landmark.new
	end

	def create 
		landmark = Landmark.new(landmark_params) 
		if landmark.save
			redirect_to landmark_path(landmark)
		else 
			render 'new'
		end 
	end	

	def show
		@landmark = Landmark.find_by(id: params[:id])
	end	

	private 

	def landmark_params 
		params.require(:landmark).permit(:name, :description, :neighborhood_id, :category_id, :image_link, :more_info_link, :address)		  
	end	
end
