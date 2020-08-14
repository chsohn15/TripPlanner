# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Use CS to create countries, regions and cities.

# Use FAKER to generate random locations. 

require 'faker'

# CS.countries.each do |c_abbr,country_name|
#     Country.create(name: country_name)
#     CS.states(c_abbr).each do |s_abbr, state_name|
#         State.create(name: state_name, country: Country.find_by(name: country_name))
#         CS.cities(s_abbr, c_abbr).each do |city_name|
#             City.create(name: city_name, state: State.find_by(name: state_name))
#         end
#     end
# end

# fairfax = City.find_by(name: "Fairfax")


Location.destroy_all
Trip.destroy_all
TripLocation.destroy_all
Country.destroy_all
State.destroy_all
City.destroy_all

2.times do
    Country.create(name: Faker::Address.unique.country)
end

5.times do
    State.create(name: Faker::Address.state, country: Country.all.sample)
end

15.times do
    City.create(name: Faker::Address.city, state: State.all.sample)
end





10.times do 
    Location.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, city: City.all.sample, category: "food")
end

10.times do
    Location.create(name: "#{Faker::Verb.base.capitalize} Park", address: Faker::Address.street_address, city: City.all.sample, category: "outdoor")
end

10.times do
    Location.create(name: "#{Faker::Name.first_name} Hotel", address: Faker::Address.street_address, city: City.all.sample, category: "hotel")
end

10.times do
    Location.create(name: "#{Faker::Name.name} Museum", address: Faker::Address.street_address, city: City.all.sample, category: "museum")
end

10.times do
    Location.create(name: "#{Faker::FunnyName.name} Business", address: Faker::Address.street_address, city: City.all.sample, category: "business")
end


trip = Trip.create(name: "Trip to Fairfax", start_date: Date.parse("2018/05/10"), end_date: Date.parse("2018/05/24"))

5.times do
    TripLocation.create(location: Location.all.sample, trip: trip, rating: rand(1..5))
end

