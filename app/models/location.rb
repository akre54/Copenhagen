class Location < ActiveRecord::Base
  attr_accessible :lat, :long, :name

  has_many :bikes
end
