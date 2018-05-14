class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :landmark
  belongs_to :user
end
