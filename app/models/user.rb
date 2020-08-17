class User < ApplicationRecord
    has_many :trips

    def display_name
        self.first_name + " " + self.last_name
    end

    def cities
    end

    def countries
    end
    
end
