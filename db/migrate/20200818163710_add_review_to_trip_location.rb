class AddReviewToTripLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :trip_locations, :review, :text
  end
end
