class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  validates_inclusion_of :condition, in: %w( fucked operational offline )

  scope :checked_out, joins(:checkouts).where(checkouts: {returned_at: nil})

  belongs_to :location

  has_many :checkouts

  def checked_out_to
    last_checkout = self.checkouts.where(returned_at: nil).limit(1).first
    last_checkout.user if last_checkout
  end
end
