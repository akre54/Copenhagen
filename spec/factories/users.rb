# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:staffer] do
    biker
    location
    password "abcd12345"
    password_confirmation {|u| u.password }
    netid {|u| u.biker.netid }
    email {|u| u.biker.email }
    admin false

    factory :admin do
      admin true
    end
  end
end
