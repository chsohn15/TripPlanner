class TripLocation < ApplicationRecord
    belongs_to :trip 
    belongs_to :location
    validates :rating, presence: true #this errors out when we click on button
    validates :review, presence: true #this errors out when we click on button
    # # validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true}
    # validates :rating, inclusion: { in: (0..10), message: "is invalid, must be between 1 and 10" }
    # if validations arent met, code crashes
end
