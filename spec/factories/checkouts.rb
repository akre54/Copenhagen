# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkout do
    bike
    biker
    location
    staffer
    helmet_requested true
    due_at Date.today + 2.days
    returned_at nil
  end
end
