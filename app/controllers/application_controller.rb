class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception 
	#allows all pages access to the current user method
	helper_method :current_user
	#checks to see if the user is logged in before calling any controller methods
	before_action :verify_login
	
	#set the current_user equal to the session id
	def current_user 
		@current_user ||= User.find_by(id: session[:user_id])
	end 
	
	#checks for login by checking for presence of a current user
	def verify_login 
		if !current_user
			redirect_to '/'
		end	 
	end				
end
