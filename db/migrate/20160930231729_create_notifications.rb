class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :appointment_id
      t.text :content

      t.timestamps
    end
  end
end
