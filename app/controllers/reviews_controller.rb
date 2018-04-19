class ReviewsController < ApplicationController

	def index 
		if params[:landmark_id]
			@reviews = Landmark.find(params[:landmark_id]).reviews 
		elsif params[:user_id]
			@reviews = User.find(params[:user_id]).reviews 
		end 
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
		@review = Review.find(params[:id])
	end 

	def update 
		review = Review.find_by(id: params[:id])
		if review.save 
			redirect_to user_reviews_path(current_user)
		else 
			render 'edit'
		end
	end	

	def destroy 
		@review = Review.find_by(id: params[:id])
		@review.destroy
		flash[:notice] = "Your review has been deleted."
		redirect_to user_reviews_path(current_user)	
	end		

	private

	def review_params
		params.require(:review).permit(:user_id, :landmark_id, :content)
	end				

end
