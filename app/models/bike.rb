class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  has_many :checkouts
  belongs_to :location
  validates_inclusion_of :condition, in: %w( fucked operational offline )

  scope :checked_out, joins(:checkouts).where({checkouts: {returned_at: nil}})
  scope :overdue, joins(:checkouts).where("checkouts.returned_at IS NULL AND checkouts.due_at < ?", Time.now)

  delegate :overdue?, to: :active_checkout, allow_nil: true

  def checkout_to(biker)
    checkout = Checkout.new(biker: biker, location: self.location)
    checkouts << checkout if checkout
    checkout
  end

  def checkin
    checkout = active_checkout
    if checkout
      checkout.checkin
    else
      errors.add :base, "bike #{id} wasn't checked out to begin with."
    end
  end

  def active_checkout
    checkouts.checked_out.first
  end

  def last_checkout
    checkouts.order('created_at DESC').first
  end

  def due_at
    checkout = active_checkout
    checkout.due_at if checkout
  end

  def checked_out?
    active_checkout != nil
  end

  def checked_out_to
    checkout = active_checkout
    checkout.biker if checkout
  end

  def to_s
    "##{self.id} (#{self.manufacturer} #{self.model})"
  end
end
