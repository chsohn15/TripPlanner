class CountriesController < ApplicationController

  def index
    @countries = Country.all
    @states = State.where(country_id: params[:country])
    @cities = City.where(state_id: params[:state])
    @locations = Location.where(city_id: params[:city])
  end
  
end
