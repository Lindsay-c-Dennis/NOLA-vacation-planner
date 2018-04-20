class ReviewsController < ApplicationController
	before_action :find_review, only: [:edit, :update, :destroy]

	def index 
		if params[:landmark_id]
			@reviews = Landmark.find(params[:landmark_id]).reviews 
		elsif params[:user_id]
			@reviews = User.find(params[:user_id]).reviews 
		end 
	end		

	def new 
		@review = Review.new
		@landmark = Landmark.find(params[:landmark_id])
		@review = @landmark.reviews.build(user_id: current_user.id, landmark_id: @landmark.id) 
	end

	def create
		review = Review.new(review_params)
		if review.save
			flash[:notice] = "Review successfully added." 
			redirect_to landmark_path(review.landmark_id)
		else 
			flash[:notice] = "Something went wrong."
			redirect_to landmark_path(review.landmark_id)
		end 
	end

	def edit 
	end 

	def update 
		@review.content = params[:review][:content]
		if @review.save 
			redirect_to user_reviews_path(current_user)
		else 
			render 'edit'
		end
	end	

	def destroy 
		@review.destroy
		flash[:notice] = "Your review has been deleted."
		redirect_to user_reviews_path(current_user)	
	end		

	private

	def review_params
		params.require(:review).permit(:user_id, :landmark_id, :content)
	end	

	def find_review 
		@review = Review.find_by(id: params[:id])
	end				

end
