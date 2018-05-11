class NeighborhoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_link, :description
  has_many :landmarks
end
