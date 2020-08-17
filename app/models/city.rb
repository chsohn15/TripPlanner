class City < ApplicationRecord
    belongs_to :state
    has_many :locations
   
    def average_rating
        city_rating = self.locations.map{|location| location.average_rating}
        if city_rating.any?
            (city_rating.sum.to_f/city_rating.count).round(2)
        else 
            "No Ratings"
        end
   end

   def total_visits
    self.locations.map{|location| location.num_of_visits}.sum
   end
    
end
