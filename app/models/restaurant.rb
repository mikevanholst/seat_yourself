class Restaurant < ActiveRecord::Base
  validates :name, :phone, :address, :presence => true

  has_many :users, through: :reservations
  
end
