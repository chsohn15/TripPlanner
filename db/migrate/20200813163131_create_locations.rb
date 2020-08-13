class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :category
      t.integer :city_id
      t.string :image_url

      t.timestamps
    end
  end
end
