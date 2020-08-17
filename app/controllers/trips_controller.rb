class TripsController < ApplicationController
    
    def index
        @trips = Trip.where(user_id: session[:user_id]) 
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
        name = params[:trip][:name]
        start_date = params[:trip][:start_date]
        end_date = params[:trip][:end_date]
        user = current_user

        @trip = Trip.new(name: name, start_date: start_date, end_date: end_date, user: user)
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
