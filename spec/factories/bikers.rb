# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biker do
    first_name { Faker::Name::first_name }
    last_name { Faker::Name::last_name }
    netid { Faker::Base.regexify(/[a-z]{2,3}\d{1,3}/) }
    email { "#{netid}@nyu.edu" }
    affiliation { Biker::AFFILIATIONS.sample }
    active true
    year_of_graduation { Kernel.rand(4) + Date.today.year }
  end
end
