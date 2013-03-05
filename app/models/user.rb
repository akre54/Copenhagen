class User < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :netid, :type, :year_of_graduation
end
