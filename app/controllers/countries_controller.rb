class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def about
    @most_visited_country = Country.most_visited_country.name
    @most_visited_city = "#{City.most_visited_city.name}, #{City.most_visited_city.state.name}"
  end


end
