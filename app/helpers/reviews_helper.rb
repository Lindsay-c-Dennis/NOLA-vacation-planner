module ReviewsHelper

	#creates module for displaying review timestamps
	def posted_at(review)
  		review.created_at.strftime("Review posted %A, %b %e, at %l:%M %p")
	end

end
