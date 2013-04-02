class Checkout < ActiveRecord::Base
  attr_accessible :due_at, :returned_at, :biker, :bike, :location
  belongs_to :biker
  belongs_to :bike
  belongs_to :location

  scope :latest, lambda{|n| order(:created_at).limit(n)}

  before_create do
    self.due_at = Date.today + 2.days
  end
end
