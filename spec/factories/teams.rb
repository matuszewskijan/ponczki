FactoryBot.define do
  factory :team do
    name "MyText"
    description "MyText"
    owner_id 1
    eaten_doughnuts 1
    awaiting_doughnuts 1
    slack_url "MyText"
    members_count 1
    bloopers_count 1
    setted_up false
  end
end
