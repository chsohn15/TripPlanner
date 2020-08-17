class User < ApplicationRecord
    has_many :trips

    def display_name
        self.first_name + " " + self.last_name
    end

    def cities
        cities = []
        self.trips.each do |trip|
            trip.unique_cities_visited.each do |city|
                cities << city
            end
        end
        cities.uniq
    end

    def countries
    
        countries = []
        self.cities.each do |city|
            countries << city.state.country
        end
        countries.uniq
    end

end
