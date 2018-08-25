class AddAvatarUrlToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :avatar_url, :string
  end
end
