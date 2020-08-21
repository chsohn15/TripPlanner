class Country < ApplicationRecord
    has_many :states

    def self.most_visited_country
        User.all.map {|u| u.country}
    end
end
