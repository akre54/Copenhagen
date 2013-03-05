class Location < ActiveRecord::Base
  attr_accessible :latlong, :name, :address, :phone, :hours, :num_helmets

  has_many :bikes
end
