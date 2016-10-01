class CreateCoachLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :coach_locations do |t|
      t.integer :coach_id
      t.integer :location_id

      t.timestamps
    end
  end
end
