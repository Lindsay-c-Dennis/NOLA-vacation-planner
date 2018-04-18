class VisitsController < ApplicationController

	def create
		visit = Visit.create(visit_params)
		flash[:message] = "Itinerary Item successfully added!"
		redirect_to user_path(current_user) 
	end 

	private

	def visit_params 
		params.require(:visit).permit(:user_id, :landmark_id)
	end	

end
