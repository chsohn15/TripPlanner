class State < ApplicationRecord
    belongs_to :country
    has_many :cities

    def highest_rated_cities
        #sort cities where the avg rating for all the locations is the highest
        self.cities.sort_by {|city| city.average_rating}.reverse
    end

    def lowest_rated_cities
        self.cities.sort_by {|city| city.average_rating}
    end

    def most_visited_cities
        #sort_by cities where the locations have the most triplocations
        self.cities.sort_by {|city| city.total_visits}.reverse
    end

    def cities_alphabetically
        self.cities.order(name: :asc)
    end
end
