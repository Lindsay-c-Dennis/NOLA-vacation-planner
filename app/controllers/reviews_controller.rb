class ReviewsController < ApplicationController

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

	private

	def review_params
		params.require(:review).permit(:user_id, :landmark_id, :content)
	end				

end
