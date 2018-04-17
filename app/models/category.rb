class Category < ApplicationRecord
	has_many :landmarks 

	validates :name, presence: true, uniqueness: true 
end
