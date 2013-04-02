class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  validates_inclusion_of :condition, in: %w( fucked operational offline )

  scope :checked_out, joins(:checkouts).where(checkouts: {returned_at: nil})

  belongs_to :location

  has_many :checkouts

  def checkout_to(biker)
    self.checkouts << Checkout.new(biker: biker, location: self.location)
  end

  def checkin
    @last_checkout = self.active_checkout
    return unless @last_checkout
    @last_checkout.returned_at = Time.now
    @last_checkout.save!
  end

  def active_checkout
    self.checkouts.where(returned_at: nil).limit(1).first
  end

  def last_checkout
    self.checkouts.order('created_at DESC').limit(1).first
  end

  def checked_out?
    self.active_checkout != nil
  end

  def checked_out_to
    last_checkout = self.active_checkout
    last_checkout.biker if last_checkout
  end

  def select_label
    "##{self.id} #{self.manufacturer} #{self.model}"
  end
end
