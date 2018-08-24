class AddDefaultValuesToTeam < ActiveRecord::Migration[5.2]
  def change
    change_column_default :teams, :eaten_doughnuts, 0
    change_column_default :teams, :awaiting_doughnuts, 0
    change_column_default :teams, :members_count, 0
    rename_column :teams, :bloopers_cont, :bloopers_count
    change_column_default :teams, :bloopers_count, 0
  end
end
