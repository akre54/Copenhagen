class Bike < ActiveRecord::Base
  attr_accessible :color, :condition, :location_id, :image_url, :manufacturer, :model

  has_many :checkouts
  belongs_to :location

  scope :operational, where(date_offline: nil)
  scope :offline, where("date_offline IS NOT NULL")
  scope :fucked, where(fucked: true)
  scope :checked_out, joins(:checkouts).merge(Checkout.checked_out)
  scope :overdue, -> { joins(:checkouts).merge(Checkout.overdue) }

  delegate :checkin, :due_at, :overdue?, to: :active_checkout, allow_nil: true

  def active_checkout
    checkouts.checked_out.first
  end

  def last_checkout
    checkouts.order('created_at DESC').first
  end

  def checked_out?
    active_checkout != nil
  end

  def checked_out_to
    active_checkout.try(:biker)
  end

  def operational?
    self.date_offline != nil
  end

  def to_s
    "##{self.id} (#{self.manufacturer} #{self.model})"
  end
end
