class Landmark < ApplicationRecord
	has_many :visits 
	has_many :users, through: :visits 
	has_many :reviews
	belongs_to :category
	belongs_to :neighborhood

	validates :name, presence: true, uniqueness: true
	validates :image_link, presence: true 
	
end
