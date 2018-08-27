class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.text :name
      t.text :description
      t.integer :owner_id
      t.integer :eaten_doughnuts
      t.integer :awaiting_doughnuts
      t.integer :bloopers_count
      t.text :slack_url
      t.integer :members_count
      t.integer :bloopers_cont

      t.timestamps
    end
  end
end
