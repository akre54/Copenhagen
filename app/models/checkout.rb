class Checkout < ActiveRecord::Base
  attr_accessible :due_at, :returned_at, :biker, :bike, :location
  belongs_to :biker
  belongs_to :bike
  belongs_to :location

  scope :latest, lambda{|n| order(:created_at).limit(n)}
  scope :checked_out, where(returned_at: nil)
  scope :overdue, where("returned_at = NULL AND due_at < ?", Time.now)

  before_create do
    self.due_at = Date.today + 2.days
  end
end
