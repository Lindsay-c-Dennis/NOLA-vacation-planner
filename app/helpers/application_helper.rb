module ApplicationHelper

	#creates dynamic page title for application layout
	def full_title(page_title = '')
		base_title = "New Orleans Vacation Planner"
		if page_title.empty?
			base_title 
		else 
			page_title + " | " + base_title
		end 
	end	

end
