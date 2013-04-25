# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bike do
    color "Blue"
    condition "operational"
    location
  end
end
