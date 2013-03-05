class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  validates_inclusion_of :condition, in: %w( operational offline )

  belongs_to :location
end
