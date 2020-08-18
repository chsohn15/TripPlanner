class TripLocationsController < ApplicationController

    before_action :find_trip_location

    def show
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
        @trip = @trip_location.trip
        @trip_location.destroy
        redirect_to trip_path(@trip)
    end


    private

    def find_trip_location
        @trip_location = TripLocation.find(params[:id])
    end

    def trip_location_params
        params.require(:trip_location).permit(:rating, :review)
    end


end
