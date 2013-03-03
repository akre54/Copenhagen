class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id

  belongs_to :location
end
