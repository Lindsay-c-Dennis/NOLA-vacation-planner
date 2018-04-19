class LandmarksController < ApplicationController

	def index
		@landmarks = Landmark.all
	end

	def new
		@landmark = Landmark.new
	end

	def create 
		@landmark = Landmark.new(landmark_params) 
		if @landmark.save
			redirect_to landmark_path(@landmark)
		else 
			render 'new'
		end 
	end	

	def edit 
		@landmark = Landmark.find_by(id: params[:id])
	end

	def update 
		@landmark = Landmark.find_by(id: params[:id])
		if @landmark.update(landmark_params)
			redirect_to landmark_path(@landmark)
		else 
			render 'edit'
		end 
	end			

	def show
		@landmark = Landmark.find_by(id: params[:id])
		@visit = @landmark.visits.build(user_id: current_user.id, landmark_id: @landmark.id)
		@review = @landmark.reviews.build(user_id: current_user.id, landmark_id: @landmark.id)
		@recent_reviews = @landmark.reviews.most_recent(3)
	end	

	private 

	def landmark_params 
		params.require(:landmark).permit(:name, :description, :neighborhood_id, :category_id, :image_link, :more_info_link, :address)		  
	end	
end
