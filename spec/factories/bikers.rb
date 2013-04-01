# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biker do
    first_name "MyString"
    last_name "MyString"
    netid "MyString"
    email "MyString"
    affiliation "MyString"
    year_of_graduation 1
  end
end
