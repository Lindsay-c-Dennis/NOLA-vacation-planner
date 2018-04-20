class SessionsController < ApplicationController
	skip_before_action :verify_login, only: [:new, :create]
	
	def new
		@user = User.new
	end

	def create
		if auth_hash = request.env["omniauth.auth"]
			oauth_email = auth_hash["info"]["email"]
			oauth_name = auth_hash["info"]["name"]
			if user = User.find_by(email: oauth_email)
				session[:user_id] = user.id 
				redirect_to user_path(user)
			else 
			    user = User.create(email: oauth_email, name: oauth_name, password: SecureRandom.hex)
			    session[:user_id] = user.id
			    redirect_to user_path(user)	
			end	
		else	
	 		user = User.find_by(name: params[:name])
			if user && user.authenticate(params[:password])
				session[:user_id] = @user.id 
				redirect_to user_path(user)
			else 
				flash[:notice] = "Your name and password did not match our records. Please try again."
				render 'new'
			end
		end		

	end 

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end

end
