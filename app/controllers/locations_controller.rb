class LocationsController < ApplicationController
    
    before_action :find_location, only: [:show, :edit, :update, :destroy]

    
    def index
        @countries = Country.all
        @states = State.where(country_id: params[:country])
        @cities = City.where(state_id: params[:state])
        @locations = Location.where(city_id: params[:city])
    end

    def show
        @location = Location.find(params[:id])
    end

    def edit
        @trip_location = TripLocation.new
    end
    
    def update
        @trip_location = TripLocation.new(location: @location)
        @trip_location.update(t_l_params)
        redirect_to trip_path(@trip_location.trip)
    end
    
    private

    def find_location
        @location = Location.find(params[:id])
    end

    def t_l_params
        params.require(:trip_location).permit(:trip_id, :rating)
    end

    
end
