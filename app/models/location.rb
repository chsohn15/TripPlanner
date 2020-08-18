class Location < ApplicationRecord
    belongs_to :city
    has_many :trip_locations
    has_many :trips, through: :trip_locations

    def state_name
        self.city.state.name
    end

    def average_rating
        if self.trip_locations.any?
        ratings = self.trip_locations.pluck(:rating)
            (ratings.sum.to_f/ratings.count).round(2)
        else 
            0
        end
    end

    def num_of_visits
        self.trip_locations.count
    end

    def reviews
        self.trip_locations.map do |trip_location|
            trip_location.review + " - " + trip_location.username
        end
    end

end
