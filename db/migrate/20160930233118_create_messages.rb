class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :notification_id
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content

      t.timestamps
    end
  end
end
