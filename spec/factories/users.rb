FactoryBot.define do
  factory :user do
    first_name "MyText"
    last_name "MyText"
    description "MyText"
    position "MyText"
    slack_nick "MyText"
    slack_id { Array.new(9) { rand(10) }.join }
    eaten_doughnuts 0
    awaiting_doughnuts 0
    delivered_doughnuts 0
    bloopers_count 0
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
