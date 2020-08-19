class TripsController < ApplicationController
    before_action :find_trip, only: [:show, :edit, :update, :destroy]

    def index
        @trips = Trip.where(user_id: session[:user_id]) 
    end

    def show
    end

    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.new(user: current_user)
        @trip.assign_attributes(trip_params)
        if @trip.valid?
            @trip.save
            redirect_to trip_path(@trip)
        else 
            render :new
        end
    end

    def edit
    end

    def update
        @trip.assign_attributes(trip_params)
        if @trip.valid?
            @trip.save
            redirect_to trip_path(@trip)
        else 
            render :edit
        end
    end

    def destroy
        @trip.delete
        redirect_to trips_path
    end

    private

    def find_trip
        @trip = Trip.find(params[:id])
    end
    
    def trip_params
        params.require(:trip).permit(:name, :start_date, :end_date)
    end

end
