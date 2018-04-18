class VisitsController < ApplicationController

	def create
		visit = Visit.create(visit_params)
		flash[:notice] = "Itinerary Item successfully added!"
		redirect_to user_path(current_user) 
	end 

	def destroy
		@visit = Visit.find_by(id: params[:id])
		@visit.destroy
		flash[:notice] = "Item removed from your itinerary."
		redirect_to user_path(current_user)
	end

	private

	def visit_params 
		params.require(:visit).permit(:user_id, :landmark_id)
	end	

end
