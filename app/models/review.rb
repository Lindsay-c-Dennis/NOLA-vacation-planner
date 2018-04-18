class Review < ApplicationRecord
	belongs_to :user 
	belongs_to :landmark

	validates :content, presence: true, uniqueness: true 
end
