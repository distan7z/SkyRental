class AddColumnToDrones < ActiveRecord::Migration[7.0]
  def change
    add_column :drones, :brand, :string
    add_column :drones, :model, :string
    add_reference :drones, :user, null: false, foreign_key: true
  end
end
