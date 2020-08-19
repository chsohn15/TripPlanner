class LocationsController < ApplicationController
    
    before_action :find_location, only: [:show, :edit, :update, :destroy, :reviews]
    before_action :find_trips, only: [:edit, :update]
    before_action :create_trip_location, only: [:edit, :update]
    
    def index
        if params[:city_id]
            @city = City.find(params[:city_id])
            @locations = Location.where(city: @city)
            if params[:category]== "food"
                @locations = Location.where(city: @city, category: "food")
            elsif params[:category]== "hotel"
                @locations = Location.where(city: @city, category: "hotel")
            elsif params[:category]== "outdoor"
                @locations = Location.where(city: @city, category: "outdoor")
            elsif params[:category]== "attraction"
                @locations = Location.where(city: @city, category: "attraction")
            elsif params[:category]== "business"
                @locations = Location.where(city: @city, category: "business")
            elsif params[:category]== "shopping"
                @locations = Location.where(city: @city, category: "shopping")
            else
                @locations = Location.where(city: @city)
            end
        end
    end

    def show
        @location = Location.find(params[:id])
    end

    def edit
    end
    
    def update
        @trip_location.assign_attributes(t_l_params)
        if @trip_location.valid?
            @trip_location.save
            redirect_to trip_path(@trip_location.trip)
        else
            render :edit
        end
        
    end


    def reviews
    end
    
    private

    def find_location
        @location = Location.find(params[:id])
    end
    
    def find_trips
        @trips = Trip.where(user: current_user)
    end

    def create_trip_location
        @trip_location = TripLocation.new(location: @location)
    end


    def t_l_params
        params.require(:trip_location).permit(:trip_id, :rating, :review)
    end

    
end
