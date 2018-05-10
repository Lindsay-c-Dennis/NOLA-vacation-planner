class LandmarkSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_link, :more_info_link, :address 
  has_many :visits 
  has_many :reviews
  belongs_to :neighborhood
  belongs_to :category
end
