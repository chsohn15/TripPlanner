class Trip < ApplicationRecord
    belongs_to :user
    has_many :trip_locations
    has_many :locations, through: :trip_locations
    validates :name, :start_date, :end_date, presence: true
    validates :name, uniqueness: {case_sensitive: false}
    validate :end_date_is_after_start_date


    def average_rating
        trip_location = TripLocation.where(trip_id: self.id) 
        if trip_location.any?
            (trip_location.pluck(:rating).sum/trip_location.count.to_f).round(2)
        else
            0
        end
    end

    def unique_cities_visited
        self.locations.map {|location| location.city}.uniq 
    end


    private 

    def end_date_is_after_start_date
        if end_date < start_date
            errors.add(:end_date, "cannot be before the start date")
        end
    end
end
