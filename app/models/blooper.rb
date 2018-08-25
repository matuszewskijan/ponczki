class Blooper < ApplicationRecord
  belongs_to :user

  after_create :update_users_and_team

  def self.new_blooper(user, finder, team)
    create(
      user_id: user.id,
      founder_id: finder.id,
      doughnut_counter: team.users.count - 1,
      delivery_status: false
    )
  end

  def update_users_and_team
    user = User.find(user_id)
    team = Team.find(user.team_id)
    team.increment_awaiting_doughnuts(doughnut_counter)
    team.users.each(&:increment_awaiting_doughnuts)
    user.increment!(:awaiting_doughnuts, -1)
  end
end
