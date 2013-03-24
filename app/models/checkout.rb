class Checkout < ActiveRecord::Base
  attr_accessible :bike_id, :user_id, :location_id
  belongs_to :user
  belongs_to :bike
  belongs_to :location
end
