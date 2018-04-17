class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception 
	helper_method :current_user
	before_action :verify_login
	

	def current_user 
		@current_user ||= User.find_by(id: session[:user_id])
	end 
	
	def verify_login 
		if !current_user
			redirect_to '/'
		end	 
	end				
end
