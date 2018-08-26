class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :bloopers
  has_many :founds, class_name: "Bloop", foreign_key: "finder_id"
  belongs_to :team, optional: true

  def self.from_omniauth(auth)
    # puts JSON.pretty_generate(auth)
    where(provider: auth.provider, slack_id: auth.info.user_id).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.name
      user.email = auth.info.email
      user.slack_id = auth.info.user_id
      user.slack_nick = auth.info.nickname
      user.email = auth.info.email
      user.avatar_url = auth.extra.identity.user.image_512
      user.password = Devise.friendly_token[0, 20]
      user.team = Team.find_by(slack_id: auth.info.team_id)
      user.save!
    end
  end

  def team_admin?
    !team_admin_id.nil?
  end

  def update_after_blooper(finder)
    increment!(:bloopers_count).increment!(:awaiting_doughnuts, -1)
    finder.increment!(:findings_count)
  end
end
