class LandmarksController < ApplicationController
	before_action :find_landmark, only: [:edit, :update, :show]

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
	end

	def update 
		if @landmark.update(landmark_params)
			redirect_to landmark_path(@landmark)
		else 
			render 'edit'
		end 
	end			

	def show
		@review = @landmark.reviews.build(user_id: current_user.id, landmark_id: @landmark.id)
		@visit = @landmark.visits.build(user_id: current_user.id, landmark_id: @landmark.id)
		@recent_reviews = @landmark.reviews.most_recent(3)
	end	

	private 

	def landmark_params 
		params.require(:landmark).permit(:name, :description, :neighborhood_id, :category_id, :image_link, :more_info_link, :address)		  
	end	

	def find_landmark
		@landmark = Landmark.find_by(id: params[:id])
	end
end
