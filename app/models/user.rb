class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :timeoutable

  attr_readonly :email

  attr_protected :password, :password_confirmation, :admin
end
