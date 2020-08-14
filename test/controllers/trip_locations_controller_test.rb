require 'test_helper'

class TripLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get trip_locations_new_url
    assert_response :success
  end

  test "should get create" do
    get trip_locations_create_url
    assert_response :success
  end

end
