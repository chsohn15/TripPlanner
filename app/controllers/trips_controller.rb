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
        if @trip.valid?
            @trip.save
            redirect_to trip_path(@trip)
        else 
            render :new
        end
    end

    def edit
        @trip = Trip.find(params[:id])
    end

    def update
        @trip = Trip.find(params[:id])
        @trip.assign_attributes(trip_params)
        if @trip.valid?
            @trip.save
            redirect_to trip_path(@trip)
        else 
            render :edit
        end
    end

    private

    def trip_params
        params.require(:trip).permit(:name, :start_date, :end_date)
    end
end
