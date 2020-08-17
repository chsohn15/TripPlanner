class LocationsController < ApplicationController
    
    before_action :find_location, only: [:show, :edit, :update, :destroy]

    
    def index
        if params[:city_id]
            @city = City.find(params[:city_id])
            @locations = Location.where(city_id: params[:city_id])
            if params[:category]
                if params[:category] == "all"
                    @locations = Location.where(city_id: params[:city_id])
                else
                    @locations = Location.where(city_id: params[:city_id], category: params[:category])
                end
            end
        else
            @locations = Location.all
        end
    end

    def show
        @location = Location.find(params[:id])
    end

    def edit
        @trips = Trip.where(user: current_user)
        @trip_location = TripLocation.new
    end
    
    def update
        @trip_location = TripLocation.new(location: @location)
        @trip_location.assign_attributes(t_l_params)
        if @trip_location.valid?
            @trip_location.save
            redirect_to trip_path(@trip_location.trip)
        else
            render :edit
        end
        
    end
    
    private

    def find_location
        @location = Location.find(params[:id])
    end

    def t_l_params
        params.require(:trip_location).permit(:trip_id, :rating)
    end

    
end
