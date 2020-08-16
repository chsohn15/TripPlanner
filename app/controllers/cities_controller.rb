class CitiesController < ApplicationController
  def index
    @cities = City.where(state_id: params[:state_id])
  end

  def show
    byebug
    @city = City.find(params[:id])
    redirect_to city_locations_path(@city)
  end


  # def locations_index
  #   byebug
  #   @city = City.find(params[:city_id])
  #   @locations = @city.locations
  #   render template: 'locations/index'
  # end
 
  # def location
  #   @city = City.find(params[:id])
 
  #   # Note that because ids are unique by table we can go directly to
  #   # Post.find — no need for @author.posts.find...
  #   @location = Location.find(params[:location_id])
  #   render template: 'locations/show'
  # end
end
