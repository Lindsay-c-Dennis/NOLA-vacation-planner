class ReviewsSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :landmark
  belongs_to :user
end
