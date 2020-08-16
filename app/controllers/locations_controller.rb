class LocationsController < ApplicationController
    
    before_action :find_location, only: [:show, :edit, :update, :destroy]

    
    def index
        if params[:city_id]
            @city = City.find(params[:city_id])
            if params[:category]
                if params[:category] == "all"
                    @locations = Location.where(city_id: params[:city_id])
                else
                    @locations = Location.where(city_id: params[:city_id], category: params[:category])
                end
            else
                @locations = Location.where(city_id: params[:city_id])
            end
        else
            @locations = Location.all
        end
        # @countries = Country.all
        # @states = State.where(country_id: params[:country])
        # @cities = City.where(state_id: params[:state])
        # city_id = params[:city_id]
        # @locations = Location.where(city_id: params[:city_id])   
        # if params[:category] == "food"
        #     @locations = @locations.where(category: "food")
        # elsif params[:category] == "outdoor"
        #     @locations = @locations.where(category: "outdoor")    
        # elsif params[:category] == "attractions"
        #     @locations = @locations.where(category: "attractions")    
        # elsif params[:category] == "shopping"
        #     @locations = @locations.where(category: "shopping")    
        # elsif params[:category] == "hotel"
        #     @locations = @locations.where(category: "hotel")    
        # elsif params[:category] == "business"
        #     @locations = @locations.where(category: "business")    
        # else
        #     @locations  
        # end
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
