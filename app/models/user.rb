class User < ActiveRecord::Base
  attr_readonly :email, :netid
  attr_protected :password, :password_confirmation, :admin

  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :timeoutable

  has_many :checkouts
  belongs_to :location
  belongs_to :biker, foreign_key: :netid, primary_key: :netid

  delegate :first_name, :last_name, :year_of_graduation, :affiliation, :to_param, :to_s, to: :biker

  # override find so we can search by netid
  def self.find(input)
    input.to_i == 0 ? find_by_netid(input) : super
  end
end
