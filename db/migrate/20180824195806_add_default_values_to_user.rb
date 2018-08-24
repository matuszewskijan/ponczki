class AddDefaultValuesToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :eaten_doughnuts, 0
    change_column_default :users, :delivered_doughnuts, 0
    change_column_default :users, :awaiting_doughnuts, 0
    change_column_default :users, :bloopers_count, 0
  end
end
