class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :parent_id

      t.timestamps
    end
  end
end
