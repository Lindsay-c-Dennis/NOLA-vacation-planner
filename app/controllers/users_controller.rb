class UsersController < ApplicationController
	skip_before_action :verify_login, only: [:new, :create]
	def new
	end 

	def create 
	end 



end
