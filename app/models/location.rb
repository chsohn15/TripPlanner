class Location < ApplicationRecord
    belongs_to :city
    has_many :trip_locations
    has_many :trips, through: :trip_locations
end
