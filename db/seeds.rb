# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


# # Use CS to create countries, regions and cities.

# # Use FAKER to generate random locations. 

# require 'faker'

# # CS.countries.each do |c_abbr,country_name|
# #     Country.create(name: country_name)
# #     CS.states(c_abbr).each do |s_abbr, state_name|
# #         State.create(name: state_name, country: Country.find_by(name: country_name))
# #         CS.cities(s_abbr, c_abbr).each do |city_name|
# #             City.create(name: city_name, state: State.find_by(name: state_name))
# #         end
# #     end
# # end

# # fairfax = City.find_by(name: "Fairfax")


# Location.destroy_all
# Trip.destroy_all
# TripLocation.destroy_all
# Country.destroy_all
# State.destroy_all
# City.destroy_all

Location.destroy_all
Trip.destroy_all
TripLocation.destroy_all
Country.destroy_all
State.destroy_all
City.destroy_all
User.destroy_all

# usa = Country.create(name: CS.countries[:US])

# CS.get(:us).each do |abbr, state_name|
#     State.create(name: state_name, country: usa)
# end

states = ["Virginia","New York", "California", "Maine", "Washington"]
states.each do |name|
    State.create(name: name, country: usa)
end

virginia = State.find_by(name: "Virginia")
new_york = State.find_by(name: "New York")
california = State.find_by(name: "California")
maine = State.find_by(name: "Maine")
washington = State.find_by(name: "Washington")

# va_city.each do |name|
#     City.create(name: name, state: virginia, description: Faker::Lorem.paragraph(sentence_count: 3))
# end

ny_cities = ["New York City", "Buffalo", "Syracuse", "Rochester", "Albany", "Brooklyn"]
ny_cities.each do |name|
    City.create(name: name, state: new_york)
end

cali_cities = ["Los Angeles", "San Diego", "San Jose", "San Francisco", "Fresno", "Sacramento", "Oakland"]
cali_cities.each do |name|
    City.create(name: name, state: california)
end

maine_cities = ["Portland", "Lewiston", "Bangor", "South Portland", "Auburn"]
maine_cities.each do |name|
    City.create(name: name, state: maine)
end

wa_cities = ["Seattle", "Spokane", "Tacoma", "Vancouver", "Everett", "Rainier", "Pasco"]
wa_cities.each do |name|
    City.create(name: name, state: washington)
end


south_korea = Country.create(name: "South Korea")

a = CS.states(:KR)
Hash[a.to_a[0,2]].each do |key, state_name|
    State.create(name:state_name, country: south_korea)
end


seoul = State.find_by(name: "Seoul")
busan = State.find_by(name: "Busan")

seoul_cities = ["Dobong", "Dongdaemun", "Dongjak", "Eunpyeong"]
seoul_cities.each do |name|
    City.create(name: name, state: seoul)
end

busan_cities = ["Haeundae", "Busanjin", "Saha", "Buk"]
busan_cities.each do |name|
    City.create(name: name, state: busan)
end

ethiopia = Country.create(name: "Ethiopia")

e_states = ["Oromia", "Tigray", "Amhara"]
e_states.each do |name|
    State.create(name: name, country: ethiopia)
end

oromia = State.find_by(name: "Oromia")
tigray = State.find_by(name: "Tigray")
amhara = State.find_by(name: "Amhara")

oromia_cities = ["Arsi", "Borena", "Jimma"]
oromia_cities.each {|name| City.create(name: name, state: oromia)}
amhara_cities = ["Agew Awi", "North Gondar", "South Wollo"]
amhara_cities.each {|name| City.create(name: name, state: amhara)}
tigray_cities = ["Mekelle", "Axum", "Adwa"]
tigray_cities.each {|name| City.create(name: name, state: tigray)}

usa.states.each do |state|
    state.cities.each do |city|

        rand(3..10).times do
            Location.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, city: city, category: "food", image_url: "https://picsum.photos/400")
        end
        rand(3..10).times do 
            Location.create(name: "#{Faker::Verb.base.capitalize} Park", address: Faker::Address.street_address, city: city, category: "outdoor",image_url: "https://picsum.photos/400")
        end
        rand(1..3).times do 
            Location.create(name: "#{Faker::Name.first_name} Hotel", address: Faker::Address.street_address, city: city, category: "hotel", image_url: "https://picsum.photos/400")
        end
        rand(1..3).times do
            Location.create(name: "#{Faker::Name.name} Museum", address: Faker::Address.street_address, city: city, category: "attraction", image_url: "https://picsum.photos/400")
        end
        rand(1..3).times do
            Location.create(name: "#{Faker::FunnyName.name} Business", address: Faker::Address.street_address, city: city, category: "business",image_url: "https://picsum.photos/400")
        end
        rand(1..3).times do
            Location.create(name: "#{Faker::FunnyName.name} Store", address: Faker::Address.street_address, city: city, category: "shopping",image_url: "https://picsum.photos/400")
        end
    end
end





# 10.times do 
#     Location.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, city: City.all.sample, category: "food")
# end

# 10.times do
#     Location.create(name: "#{Faker::Verb.base.capitalize} Park", address: Faker::Address.street_address, city: City.all.sample, category: "outdoor")
# end

# 10.times do
#     Location.create(name: "#{Faker::Name.first_name} Hotel", address: Faker::Address.street_address, city: City.all.sample, category: "hotel")
# end




# trip = Trip.create(name: "Trip to Fairfax", start_date: Date.parse("2018/05/10"), end_date: Date.parse("2018/05/24"))

# 5.times do
#     TripLocation.create(location: Location.all.sample, trip: trip, rating: rand(1..5))
# end

