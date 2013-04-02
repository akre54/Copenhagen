class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  delegate :checked_out, :overdue, to: :checkouts

  has_many :checkouts
  belongs_to :location
  validates_inclusion_of :condition, in: %w( fucked operational offline )

  def checkout_to(biker)
    self.checkouts << Checkout.new(biker: biker, location: self.location)
  end

  def checkin
    last_checkout = self.active_checkout
    return unless last_checkout
    last_checkout.returned_at = Time.now
    last_checkout.save
  end

  def active_checkout
    self.checkouts.checked_out.limit(1).first
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

  def to_s
    "##{self.id} (#{self.manufacturer} #{self.model})"
  end
end
