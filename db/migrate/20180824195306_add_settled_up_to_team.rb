class AddSettledUpToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :settled_up, :boolean
  end
end
