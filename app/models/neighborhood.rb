class Neighborhood < ApplicationRecord
	has_many :landmarks

	validates :name, presence: true, uniqueness:true
	validates :image_link, presence: true 
end
