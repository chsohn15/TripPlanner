class TripLocation < ApplicationRecord
    belongs_to :trip 
    belongs_to :location
    validates :rating, presence: true
    # validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true}
end
