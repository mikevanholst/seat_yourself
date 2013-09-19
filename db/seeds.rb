# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: "Smitty's", category: "Family", address: "1 First St.", phone: "555-555-5555", description: "Classic pancake house", seats: 100, neighbourhood: "Syruptown", price_range: "under $10")