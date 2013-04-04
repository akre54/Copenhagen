class Checkout < ActiveRecord::Base
  attr_accessible :due_at, :returned_at, :biker, :bike, :location
  attr_accessor :helmet_requested
  belongs_to :biker
  belongs_to :bike
  belongs_to :location

  scope :latest, lambda{|n| order(:created_at).limit(n)}
  scope :checked_out, where(returned_at: nil)
  scope :overdue, where("returned_at = NULL AND due_at < ?", Time.now)

  validate :not_checked_out, on: :create

  before_create do
    self.due_at = Date.today + 2.days
  end


  def checkin
    returned_at = Time.now
    save
  end

  private

  def not_checked_out
    if bike.checked_out?
      errors.add :base, "Bike already checked out to #{bike.checked_out_to}"
    end
  end
end
