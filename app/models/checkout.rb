class Checkout < ActiveRecord::Base
  attr_accessible :bike_id, :user_id, :location_id, :due_at, :returned_at
  belongs_to :user
  belongs_to :bike
  belongs_to :location

  scope :latest, lambda{|n| order(:created_at).limit(n)}

  after_create :update_due_date

  def update_due_date
    self.due_at = self.created_at + 2.days
  end
end
