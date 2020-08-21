class Trip < ApplicationRecord
    belongs_to :user
    has_many :trip_locations
    has_many :locations, through: :trip_locations
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :end_date_is_after_start_date, if: :date_present?


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

    def date_present?
        start_date.presence && end_date.presence
    end
end
