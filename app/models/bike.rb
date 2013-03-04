class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  belongs_to :location
end
