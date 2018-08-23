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
    team_id 1
  end
end
