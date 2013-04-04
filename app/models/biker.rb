class Biker < ActiveRecord::Base
  attr_readonly :email, :netid

  attr_accessible :remember_me, :first_name, :last_name, :affilition, :active
                  :year_of_graduation

  scope :active, where(active: true)

  has_many :checkouts

  AFFILIATIONS = %w(undergraduate graduate faculty staff).freeze

  validates_inclusion_of :affiliation, in: AFFILIATIONS

  def has_bike_out?
    checkouts.checked_out != []
  end

  def can_check_out?
    active && !has_bike_out?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_param
    netid
  end

  # override find so we can search by netid
  def self.find(input)
    input.to_i == 0 ? find_by_netid(input) : super
  end

end
