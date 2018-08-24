class AddTeamAdminIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :team_admin_id, :integer, default: nil
  end
end
