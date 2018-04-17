class StaticPagesController < ApplicationController
	skip_before_action :verify_login, only: [:home]
	
	def home
	end

end
