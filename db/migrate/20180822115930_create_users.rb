class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :description
      t.text :position
      t.text :slack_nick
      t.integer :eaten_doughnuts
      t.integer :awaiting_doughnuts
      t.integer :delivered_doughnuts
      t.integer :bloopers_count
      t.integer :team_id

      t.timestamps
    end
  end
end
