class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :client_id
      t.integer :coach_activity_id

      t.timestamps
    end
  end
end
