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


usa = Country.create(name: CS.countries[:US])

CS.get(:us).each do |abbr, state_name|
    State.create(name: state_name, country: usa)
end

virginia = State.find_by(name: "Virginia")
new_york = State.find_by(name: "New York")
california = State.find_by(name: "California")

va_city = ["Fairfax", "Springfield", "Centreville", "Chantilly", "Burke", "Richmond", "Charlottesville", "Leesburg"]

va_city.each do |name|
    City.create(name: name, state: virginia, description: Faker::Lorem.paragraph(sentence_count: 3))
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

