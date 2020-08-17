class AddDescriptionToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :description, :text
  end
end
