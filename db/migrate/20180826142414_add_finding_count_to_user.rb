class AddFindingCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :findings_count, :integer
  end
end
