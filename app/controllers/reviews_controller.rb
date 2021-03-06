class ReviewsController < ApplicationController
	before_action :find_review, only: [:edit, :update, :destroy]
	

	def index 
		if params[:landmark_id]
			@reviews = Landmark.find(params[:landmark_id]).reviews 
		elsif params[:user_id]
			@reviews = User.find(params[:user_id]).reviews.reverse 
		end
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @reviews }
		end	
	end		

	def new 
		@landmark = Landmark.find(params[:landmark_id])
		@review = Review.new(user_id: current_user.id, landmark_id: @landmark.id)
		render partial: 'form', locals: { review: @review, landmark: @landmark }
		
	end

	def create
		@review = Review.new(review_params)
		if @review.save
			render json: @review
		else 
			render 'new'
		end 
	end

	def edit 
		@landmark = Landmark.find(params[:landmark_id])
		render partial: 'form', locals: { review: @review, landmark: @landmark }
	end 

	def update
		@review.update(review_params)
		render json: @review	
	end	

	def destroy 
		@review.destroy
	end	

	def recent_reviews 
		@recent_reviews = Review.most_recent(10)
	end	

	private

	def review_params
		params.require(:review).permit(:user_id, :landmark_id, :content)
	end	

	def find_review 
		@review = Review.find_by(id: params[:id])
	end			

end
