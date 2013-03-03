class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location

  belongs_to :location
end
