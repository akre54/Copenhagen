class Biker < ActiveRecord::Base
  attr_readonly :email, :netid

  attr_accessible :remember_me, :first_name, :last_name, :affilition,
                  :year_of_graduation

  has_many :checkouts

  AFFILIATIONS = %w(undergraduate graduate faculty staff).freeze

  validates_inclusion_of :affiliation, in: AFFILIATIONS

  def full_name
    "#{first_name} #{last_name}"
  end

end
