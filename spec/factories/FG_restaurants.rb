# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    seats 100
    #seats { 2 + rand(18) }
    phone { Faker::PhoneNumber.phone_number}

    factory :restaurant_with_full_description do
      price_range { ["under $10", "$10 to $15", "$15 to $25","$25 to $30", "over $30"].sample }
      neighbourhood { Faker::Address.city }
      description { Faker::Lorem.paragraph(2) }
    end

  end
end
