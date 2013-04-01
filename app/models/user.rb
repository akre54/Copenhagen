class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :token_authenticatable, :timeoutable

  attr_readonly :email

  attr_protected :password, :password_confirmation, :admin
end
