class LocationsController < ApplicationController
    
    
    def index
        @locations = Location.where(city_id: params[:city])
    end

    def show
        @location = Location.find(params[:id])
    end

    
end
