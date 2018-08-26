FactoryBot.define do
  factory :blooper do
    device "MyText"
    description "MyText"
    time "2018-08-22"
    doughnut_counter 1
    association :user
    association :finder, factory: :user
  end
end
