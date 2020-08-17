class Trip < ApplicationRecord
    belongs_to :user
    has_many :trip_locations
    has_many :locations, through: :trip_locations
    validates :name, :start_date, :end_date, presence: true


    def average_rating
        a = TripLocation.where(trip_id: self.id) 
        if a.any?
            a.pluck(:rating).sum/a.count.to_f
        else
            0
        end
    end

    def unique_cities_visited
        self.locations.map {|location| location.city}.uniq 
    end
end
