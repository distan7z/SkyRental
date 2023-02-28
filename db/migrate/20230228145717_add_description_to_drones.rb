class AddDescriptionToDrones < ActiveRecord::Migration[7.0]
  def change
    add_column :drones, :description, :text
  end
end
