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

usa = Country.create(name: CS.countries[:US])


states = ["Virginia","New York", "California", "Maine", "Washington"]
states.each do |name|
    State.create(name: name, country: usa)
end

virginia = State.find_by(name: "Virginia")
new_york = State.find_by(name: "New York")
california = State.find_by(name: "California")
maine = State.find_by(name: "Maine")
washington = State.find_by(name: "Washington")

va_city = ["Fairfax", "Springfield", "Centreville", "Chantilly", "Burke", "Richmond", "Charlottesville", "Leesburg"]

va_city.each do |name|
    City.create(name: name, state: virginia, description: Faker::Lorem.paragraph(sentence_count: 3))
end

ny_cities = ["New York City", "Buffalo", "Syracuse", "Rochester", "Albany", "Brooklyn"]
ny_cities.each do |name|
    City.create(name: name, state: new_york, description: Faker::Lorem.paragraph(sentence_count: 3))
end

cali_cities = ["Los Angeles", "San Diego", "San Jose", "San Francisco", "Fresno", "Sacramento", "Oakland"]
cali_cities.each do |name|
    City.create(name: name, state: california, description: Faker::Lorem.paragraph(sentence_count: 3))
end

maine_cities = ["Portland", "Lewiston", "Bangor", "South Portland", "Auburn"]
maine_cities.each do |name|
    City.create(name: name, state: maine, description: Faker::Lorem.paragraph(sentence_count: 3))
end

wa_cities = ["Seattle", "Spokane", "Tacoma", "Vancouver", "Everett", "Rainier", "Pasco"]
wa_cities.each do |name|
    City.create(name: name, state: washington, description: Faker::Lorem.paragraph(sentence_count: 3))
end

City.all.each do |city|
    city.update(description: "Discover an essential chapter of America's history in the cobblestone streets, river walks and monuments of #{city.name}. Originally a colonial settlement, #{city.name} is now a thriving hub for culture, shopping and outdoor fun. Explore Civil War history at the American Civil War Museum, stroll along the canal downtown or test your nerve whitewater rafting on the James River. With lively neighborhoods and a vibrant restaurant scene, #{city.name} is perfect for a quick break or an extended getaway.")
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
    City.create(name: name, state: seoul, description: Faker::Lorem.paragraph(sentence_count: 3))
end

busan_cities = ["Haeundae", "Busanjin", "Saha", "Buk"]
busan_cities.each do |name|
    City.create(name: name, state: busan, description: Faker::Lorem.paragraph(sentence_count: 3))
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
oromia_cities.each {|name| City.create(name: name, state: oromia, description: Faker::Lorem.paragraph(sentence_count: 3))}
amhara_cities = ["Agew Awi", "North Gondar", "South Wollo"]
amhara_cities.each {|name| City.create(name: name, state: amhara, description: Faker::Lorem.paragraph(sentence_count: 3))}
tigray_cities = ["Mekelle", "Axum", "Adwa"]
tigray_cities.each {|name| City.create(name: name, state: tigray, description: Faker::Lorem.paragraph(sentence_count: 3))}

usa.states.each do |state|
    state.cities.each do |city|

        rand(3..10).times do
            Location.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, city: city, category: "food", image_url: Faker::Company.logo)
        end
        rand(3..10).times do 
            Location.create(name: "#{Faker::Verb.base.capitalize} Park", address: Faker::Address.street_address, city: city, category: "outdoor", image_url: "https://picsum.photos/600/400?random=1")
        end
        rand(1..3).times do 
            Location.create(name: "#{Faker::Name.first_name} Hotel", address: Faker::Address.street_address, city: city, category: "hotel", image_url: Faker::Company.logo)
        end
        rand(1..3).times do
            Location.create(name: "#{Faker::Name.name} Museum", address: Faker::Address.street_address, city: city, category: "attraction", image_url: Faker::Company.logo)
        end
        rand(1..3).times do
            Location.create(name: "#{Faker::FunnyName.name} Business", address: Faker::Address.street_address, city: city, category: "business",image_url: Faker::Company.logo)
        end
        rand(1..3).times do
            Location.create(name: "#{Faker::FunnyName.name} Store", address: Faker::Address.street_address, city: city, category: "shopping",image_url: Faker::Company.logo)
        end
    end
end

10.times do
    User.create(username: Faker::Name.unique.first_name, password: "Test1", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "test@email.com")
end

5.times do
    Trip.create(name: 'test', start_date: "2010/01/01", end_date: "2010/02/01", user: User.all.sample)
end

Location.all.each do |location|
    rand(3..6).times do
        TripLocation.create(trip: Trip.all.sample, location: location, rating: rand(1..10), review: Faker::Company.catch_phrase)
    end
end





