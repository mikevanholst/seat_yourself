# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    price_range { ["under $10", "$10 to $15", "$15 to $25","$25 to $30", "over $30"].sample }
    neighbourhood { Faker::Address.city }
    seats { 2 + rand(18) }
    phone { Faker::PhoneNumber.phone_number}
  end
end
