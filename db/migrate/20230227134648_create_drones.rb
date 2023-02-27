class CreateDrones < ActiveRecord::Migration[7.0]
  def change
    create_table :drones do |t|

      t.timestamps
    end
  end
end
