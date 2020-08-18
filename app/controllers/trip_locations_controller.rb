class TripLocationsController < ApplicationController

    before_action :find_trip_location

    def show
        # @trip_location = TripLocation.find(params[:id])
    end
    
    def edit
        # @trip_location = TripLocation.find(params[:id])
    end

    def update
        @trip_location.assign_attributes(trip_location_params)
        if @trip_location.valid?
            @trip_location.save
            redirect_to trip_path(@trip_location.trip)
        else
            render :edit
        end
    end

    def destroy
        @trip_location.delete
        redirect_to trips_path
    end

    def find_trip_location
        @trip_location = TripLocation.find(params[:id])
    end

    def trip_location_params
        params.require(:trip_location).permit(:rating, :review)
    end


end
