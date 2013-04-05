class Checkout < ActiveRecord::Base
  attr_accessible :due_at, :returned_at, :helmet_requested, :biker, :bike, :location, :staffer

  belongs_to :biker
  belongs_to :bike
  belongs_to :location
  belongs_to :staffer, class_name: :User

  scope :latest, lambda{|n| order(:created_at).limit(n)}
  scope :checked_out, where(returned_at: nil)
  scope :overdue, where("returned_at = NULL AND due_at < ?", Time.now)

  validate :can_be_checked_out, on: :create

  before_create do
    self.due_at = Date.today + 2.days
  end

  after_create do
    self.location.decrement(:num_helmets) if self.helmet_requested?
  end


  def checked_out?
    returned_at == nil
  end

  def overdue?
    checked_out? && due_at < Time.now
  end

  def checkin
    self.location.increment(:num_helmets) if self.helmet_requested?
    self.returned_at = Time.now
    save
  end

  private

  def can_be_checked_out
    if bike.checked_out?
      errors.add :base, "Bike already checked out to #{bike.checked_out_to}"
    elsif biker.has_bike_out?
      errors.add :base, "#{biker} already has a bike checked out. Can't check out more than one."
    elsif !biker.active?
      errors.add :base, "#{biker} is not allowed to check out bikes."
    else
      true
    end
  end
end
