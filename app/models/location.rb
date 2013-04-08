class Location < ActiveRecord::Base
  attr_accessible :latlong, :name, :address, :phone, :hours, :num_helmets

  has_many :bikes
  has_many :checkouts
  has_many :staffers, class_name: :User

  def to_s
    name
  end
end
