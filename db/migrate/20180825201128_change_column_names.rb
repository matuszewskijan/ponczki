class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :slack_user_id, :slack_id
    rename_column :teams, :slack_team_id, :slack_id
    rename_column :teams, :settled_up, :setted_up
    rename_column :bloopers, :founder_id, :finder_id
  end
end
