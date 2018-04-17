class UsersController < ApplicationController
	skip_before_action :verify_login, only: [:new, :create]
	def new
		@user = User.new 
	end 

	def create 
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to user_path(user)
		else 
			flash[:notice] = "Something's wrong!"
			render 'new'
		end		
	end 

	def show
		@user = User.find_by(id: session[:user_id])
	end 
	
	private 

	def user_params 
		params.require(:user).permit(:username, :password, :email)
	end		

end
