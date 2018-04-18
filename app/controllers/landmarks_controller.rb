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

end
