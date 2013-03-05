class User < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :netid, :affilition, :year_of_graduation

  validates_inclusion_of :affilition, in: %w(undergraduate graduate faculty staff)
end
