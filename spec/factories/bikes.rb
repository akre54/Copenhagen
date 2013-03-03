# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bike do
    color "MyString"
    condition "MyText"
    location 1
  end
end
