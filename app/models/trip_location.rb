class TripLocation < ApplicationRecord
    belongs_to :trip 
    belongs_to :location
    validates :rating, presence: true
    # validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true}
    validates :rating, inclusion: { in: (0..10), message: "is invalid, must be between 1 and 5" }
end
