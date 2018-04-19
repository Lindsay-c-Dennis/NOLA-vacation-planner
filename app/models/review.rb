class Review < ApplicationRecord
	belongs_to :user 
	belongs_to :landmark

	validates :content, presence: true, uniqueness: true 

	scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
end
