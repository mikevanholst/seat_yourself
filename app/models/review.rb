class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user
  scope :newest_first, order("created_at DESC" )

end
