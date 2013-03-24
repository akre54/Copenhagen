class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  validates_inclusion_of :condition, in: %w( fucked operational offline )

  scope :checked_out, joins(:checkouts).where(checkouts: {returned_at: nil})

  belongs_to :location

  has_many :checkouts
end
