class Country < ApplicationRecord
    has_many :states

    def self.most_visited_country
        country_list = []
        User.all.each do |user|
            user.countries.each do |country|
                country_list << country
            end
        end
        country_list.max_by{|country| country_list.count(country)}
    end
end
