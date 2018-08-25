class Blooper < ApplicationRecord
  belongs_to :user

  def self.new_bloop(user, finder, team)
    create(
      user_id: user.id,
      founder_id: finder.id,
      doughnut_counter: team.users.count,
      delivery_status: false
    )
  end
end
