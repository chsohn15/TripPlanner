class CitiesController < ApplicationController
  def index
    @cities = State.find(params[:state_id]).cities
  end

  def show
    @city = City.find(params[:id])
  end


end
