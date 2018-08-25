class Team < ApplicationRecord
  has_many :users
  has_many :bloopers, through: :users
  has_one :admin, class_name: "User", foreign_key: "team_admin_id"

  def current_user_is_admin?(current_user)
    id == current_user.team_admin_id
  end

  def self.from_omniauth(auth)
    # puts JSON.pretty_generate(auth)
    where(slack_team_id: auth.extra.identity.team.id).first_or_create do |team|
      team.slack_team_id = auth.extra.identity.team.id
      team.name = auth.extra.identity.team.name
      team.slack_url = "https://#{auth.extra.identity.team.domain}.slack.com"
      team.slack_name = auth.extra.identity.team.domain
      team.avatar_url = auth.extra.identity.team.image_230
      team.save!
    end
  end

  def self.from_api(params); end

  def add_user(user)
    user.team = self
    self.members_count += 1
    user.save!
  end

  def add_admin_user(user)
    add_user(user)
    user.team_admin_id = id
    user.save!
  end
end
