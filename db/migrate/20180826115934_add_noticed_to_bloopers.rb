class AddNoticedToBloopers < ActiveRecord::Migration[5.2]
  def change
    add_column :bloopers, :noticed, :boolean
  end
end
