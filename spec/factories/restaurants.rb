# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "MyString"
    address "MyText"
    price_range "MyString"
    neighbourhood "MyString"
    seats 1
    description "MyText"
  end
end
