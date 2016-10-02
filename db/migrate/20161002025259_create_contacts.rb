class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :name
      t.string :tel
      t.string :picture

      t.timestamps
    end
  end
end
