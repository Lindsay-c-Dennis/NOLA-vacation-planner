class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :cu
  belongs_to :landmark
  belongs_to :user

  def cu 
  	return current_user
  end
end
