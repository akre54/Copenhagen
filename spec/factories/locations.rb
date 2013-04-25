# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name { Faker::Name::first_name }
    latlong "40.732082,-73.992005"
    num_helmets 4
  end
end
