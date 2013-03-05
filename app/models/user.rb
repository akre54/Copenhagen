class User < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :netid, :affilition, :year_of_graduation


  AFFILIATIONS = %w(undergraduate graduate faculty staff).freeze

  validates_inclusion_of :affilition, in: AFFILIATIONS
end
