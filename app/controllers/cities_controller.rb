class CitiesController < ApplicationController
  def index
    @state = State.find(params[:state_id])
    @cities = @state.cities
    if params[:sort_by] == "Highest Rated"
      @cities = @state.highest_rated_cities
    elsif params[:sort_by] == "Lowest Rated"
      @cities = @state.lowest_rated_cities
    elsif params[:sort_by] == "Most Visited"
      @cities = @state.most_visited_cities
    elsif params[:sort_by] == "Alphabetically (A-Z)"
      @cities = @state.cities_alphabetically
    end
  end

  def show
    @city = City.find(params[:id])
  end


end
