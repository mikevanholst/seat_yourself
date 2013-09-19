class Restaurant < ActiveRecord::Base
  validates :name, :phone, :address, :presence => true
end
