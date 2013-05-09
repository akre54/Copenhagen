class Biker < ActiveRecord::Base

  scope :active, where(active: true)

  has_many :checkouts

  AFFILIATIONS = %w(undergraduate graduate faculty staff).freeze

  validates_inclusion_of :affiliation, in: AFFILIATIONS
  validates_format_of :netid, with: /\A[a-z]{2,5}\d{1,5}\z/

  def has_bike_out?
    !checkouts.checked_out.empty?
  end

  def can_check_out?
    active && !has_bike_out?
  end

  def to_param
    netid
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  # override find so we can search by netid
  def self.find(input)
    input.to_i == 0 ? find_by_netid(input) : super
  end
end
