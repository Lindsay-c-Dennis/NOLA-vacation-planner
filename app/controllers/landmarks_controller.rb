class LandmarksController < ApplicationController

	def index
		@landmarks = Landmark.all
	end

end
