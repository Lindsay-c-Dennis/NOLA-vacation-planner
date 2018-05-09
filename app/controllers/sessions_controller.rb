class SessionsController < ApplicationController
	skip_before_action :verify_login, only: [:new, :create]
	
	def new
		@user = User.new
	end

	def create
		#if user signs in with google
		if auth_hash = request.env["omniauth.auth"]["info"]
			oauth_email = auth_hash["email"]
			oauth_name = auth_hash["name"]
			#check to see if account with that email exists, if so, log user in
			if user = User.find_by(email: oauth_email)
				session[:user_id] = user.id 
				redirect_to user_path(user)
			#if not, create a new user with the email and name info from google, create a secure password for user	
			else 
			    user = User.create(email: oauth_email, name: oauth_name, password: SecureRandom.hex)
			    session[:user_id] = user.id
			    redirect_to user_path(user)	
			end	
		else
			#if user signs in through regular log in page	
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
