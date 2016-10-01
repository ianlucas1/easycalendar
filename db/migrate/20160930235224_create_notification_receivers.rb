class CreateNotificationReceivers < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_receivers do |t|
      t.integer :notification_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
