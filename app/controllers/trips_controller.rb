class TripsController < ApplicationController
    
    def index
        @trips = Trip.where(user_id: session[:user_id]) 
    end

    def show
        @trip = Trip.find(params[:id])
    end

    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.new(user: current_user)
        @trip.assign_attributes(trip_params)
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
