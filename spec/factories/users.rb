# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    netid ""
    first_name ""
    last_name ""
    year_of_graduation ""
    email_address ""
    type ""
  end
end
