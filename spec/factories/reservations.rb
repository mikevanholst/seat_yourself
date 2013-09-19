# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    party_size 1
    time_slot "2013-09-19 16:21:23"
  end
end
