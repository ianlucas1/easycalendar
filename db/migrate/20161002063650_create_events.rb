class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :creator
      t.datetime :start
      t.string :status
      t.string :link
      t.string :calendar

      t.timestamps
    end
  end
end
