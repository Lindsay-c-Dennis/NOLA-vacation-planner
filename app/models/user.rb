class User < ApplicationRecord
	has_secure_password
	has_many :visits 
	has_many :landmarks, through: :visits 
	has_many :reviews

	validates :username, presence: true, uniqueness: true 
	validates :password, presence: true 
	validates :email, presence: true 
end
