# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Use CS to create countries, regions and cities.

# Use FAKER to generate random locations. 
Country.destroy_all
State.destroy_all
City.destroy_all


CS.countries.each do |c_abbr,country_name|
    Country.create(name: country_name)
    CS.states(c_abbr).each do |s_abbr, state_name|
        State.create(name: state_name, country: Country.find_by(name: country_name))
        CS.cities(s_abbr, c_abbr).each do |city_name|
            City.create(name: city_name, state: State.find_by(name: state_name))
        end
    end
end