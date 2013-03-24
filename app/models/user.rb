class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :token_authenticatable, :timeoutable

  attr_readonly :email, :netid

  attr_accessible :remember_me, :first_name, :last_name, :affilition,
                  :year_of_graduation

  attr_protected :password, :password_confirmation, :admin

  has_many :checkouts


  AFFILIATIONS = %w(undergraduate graduate faculty staff).freeze

  validates_inclusion_of :affilition, in: AFFILIATIONS

  def full_name
    "#{first_name} #{last_name}"
  end
end
