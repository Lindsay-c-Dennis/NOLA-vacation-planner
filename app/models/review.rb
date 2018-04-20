class Review < ApplicationRecord
	belongs_to :user 
	belongs_to :landmark

	validates :content, presence: true, uniqueness: true 

	scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }

	def posted_at
  		created_at.strftime("Review posted %A, %b %e, at %l:%M %p")
	end
end
