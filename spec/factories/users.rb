FactoryBot.define do
  factory :user do
    first_name "MyText"
    last_name "MyText"
    description "MyText"
    position "MyText"
    slack_nick "MyText"
    eaten_doughnuts 1
    awaiting_doughnuts 1
    delivered_doughnuts 1
    bloopers_count 1
    team_admin_id nil
    email { Faker::Internet.email }
    password { Devise.friendly_token[0, 20] }
    provider "slack"
    association :team

    trait :admin do
      team_admin_id 1
    end
  end
end
