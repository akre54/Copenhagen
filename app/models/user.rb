class User < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :netid, :type, :year_of_graduation

  validates_inclusion_of :type, in: %w(undergraduate graduate faculty staff)
end
