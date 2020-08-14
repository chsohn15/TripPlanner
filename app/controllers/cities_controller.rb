class CitiesController < ApplicationController
  def index
    @cities = City.where(state_id: params[:state_id])
  end
end
