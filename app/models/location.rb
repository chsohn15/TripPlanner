class Location < ApplicationRecord
    belongs_to :city
    has_many :trip_locations
    has_many :trips, through: :trip_locations

    def state_name
        self.city.state.name
    end
end
