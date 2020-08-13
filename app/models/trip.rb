class Trip < ApplicationRecord
    has_many :trip_locations
    has_many :locations, through: :trip_locations



    def average_rating
        a = TripLocation.where(trip_id: self.id) 
        if a.any?
            a.pluck(:rating).sum/a.count.to_f
        else
            0
        end
    end
end
