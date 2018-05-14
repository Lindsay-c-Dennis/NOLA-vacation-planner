class ReviewsController < ApplicationController
	before_action :find_review, only: [:edit, :update, :destroy]
	#before_action :find_landmark, only: [:new, :create]

	def index 
		if params[:landmark_id]
			@reviews = Landmark.find(params[:landmark_id]).reviews 
		elsif params[:user_id]
			@reviews = User.find(params[:user_id]).reviews 
		end
		render json: @reviews 
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

	def find_landmark
		@landmark = Landmark.find_by(params[:landmark_id])
	end				

end
