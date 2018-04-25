class UsersController < ApplicationController
	before_action :find_user, only: [:edit, :update, :show]
	#override the verify login method from the application controller to allow certain methods to be called before login
	skip_before_action :verify_login, only: [:new, :create]
	
	def new
		@user = User.new 
	end 

	def create 
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else 
			render 'new'
		end		
	end 

	def show
		@visits = @user.visits
	end 

	def edit
	end	

	def update
		@user.guide_status = params[:user][:guide_status]
		@user.save
		redirect_to user_path(@user)
	end
	
	private 

	def user_params 
		params.require(:user).permit(:name, :password, :password_confirmation, :email, :guide_status)
	end		

	def find_user 
		@user = User.find_by(id: params[:id])
	end
end
