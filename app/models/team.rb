class Team < ApplicationRecord
  has_many :users
  has_many :bloopers, through: :users
  has_one :admin, class_name: "User", foreign_key: "team_admin_id"

  def self.from_omniauth(auth)
    # puts JSON.pretty_generate(auth)
    where(slack_team_id: auth.extra.identity.team.id).first_or_create do |team|
      team.slack_team_id = auth.extra.identity.team.id
      team.name = auth.extra.identity.team.name
      team.slack_url = "https://#{auth.extra.identity.team.domain}.slack.com"
      team.slack_name = auth.extra.identity.team.domain
      team.save!
    end
  end
end
