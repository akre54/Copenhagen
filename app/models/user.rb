class User < Biker
  attr_protected :password, :password_confirmation, :admin

  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :timeoutable

  belongs_to :location
end
