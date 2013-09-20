# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    party_size { 2 + rand(18) }
    time_slot 7
  
    :restaurant
  end
end
