class CreateBloopers < ActiveRecord::Migration[5.2]
  def change
    create_table :bloopers do |t|
      t.integer :user_id
      t.text :device
      t.text :description
      t.date :time
      t.integer :founder_id

      t.timestamps
    end
  end
end
