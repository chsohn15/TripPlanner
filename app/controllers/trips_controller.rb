class TripsController < ApplicationController
    def index
        @trips = Trip.all 
    end
    
    def all_countries_states_cities
        @countries = Country.all
        @states = State.all
        @cities = City.all
    end

    def show
        @trip = Trip.find(params[:id])
    end

    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.new(trip_params)
        @trip.save
        redirect_to trip_path(@trip)
    end

    def edit
        @trip = Trip.find(params[:id])
    end

    def update
        @trip = Trip.find(params[:id])
        @trip.update(trip_params)
        redirect_to trip_path(@trip)
    end

    private

    def trip_params
        params.require(:trip).permit(:name, :start_date, :end_date)
    end
end