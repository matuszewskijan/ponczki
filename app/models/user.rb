class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :bloopers
  has_many :founds, class_name: "Bloop", foreign_key: "founder_id"
  belongs_to :team, optional: true

  def self.from_omniauth(auth)
    # puts JSON.pretty_generate(auth)
    where(provider: auth.provider, slack_user_id: auth.uid).first_or_create do |user|
      user.first_name = auth.info.name
      user.description = auth.info.name
      user.email = auth.info.email
      user.slack_user_id = auth.uid
      user.slack_nick = auth.info.nickname
      user.email = auth.info.email
      user.avatar_url = auth.extra.identity.user.image_512
      user.password = Devise.friendly_token[0, 20]
      user.save!
    end
  end
end
