class Landmark < ApplicationRecord
	has_many :visits 
	has_many :users, through: :visits 
	belongs_to :category
	belongs_to :neighborhood

	validates :name, presence: true, uniqueness: true 
	
end
