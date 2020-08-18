class User < ApplicationRecord
    PASSWORD_FORMAT = /\A
    (?=.{5,})          # Must contain 5 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
    /x

    has_secure_password
    has_many :trips
    validates :password, 
        presence: true, 
        length: { in: (5..12) }, 
        format: { with: PASSWORD_FORMAT }, 
        confirmation: true, 
        on: :create
    validates :password, 
        length: { in: (5..12) }, 
        format: { with: PASSWORD_FORMAT }, 
        confirmation: true, 
        allow_blank: true,
        on: :update 

    validates :username, uniqueness: {case_sensitive: false}
    validates :username, :first_name, :last_name, :email, presence: true

    def display_name
        self.first_name + " " + self.last_name
    end

    def cities
        cities = []
        self.trips.each do |trip|
            trip.unique_cities_visited.each do |city|
                cities << city
            end
        end
        cities.uniq
    end

    def countries
        countries = []
        self.cities.each do |city|
            countries << city.state.country
        end
        countries.uniq
    end

end
