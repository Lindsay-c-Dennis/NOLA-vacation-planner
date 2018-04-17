class SessionsController < ApplicationController
	skip_before_action :verify_login, only: [:new, :create]
	def new
		@user = User.new
	end

	def create
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect_to user_path(user)
		else 
			flash[:notice] = "Your username or password did not match our records. Please try again."
			render 'new'
		end	

	end 

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end

end
