class Bike < ActiveRecord::Base
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
    date_offline == nil
  end

  def take_offline!
    update_attribute(:date_offline, Time.now)
  end

  def bring_online!
    update_attribute(:date_offline, nil)
  end

  def to_s
    "##{id} (#{manufacturer} #{model})"
  end
end
