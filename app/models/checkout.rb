class Checkout < ActiveRecord::Base
  attr_accessible :bike_id
  attr_accessible :user_id
  belongs_to :user
  belongs_to :bike
end
