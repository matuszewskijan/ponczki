class Blooper < ApplicationRecord
  belongs_to :user
  belongs_to :finder, class_name: "User", foreign_key: "finder_id"
  belongs_to :team, required: false

  scope :not_delivered, -> { where(delivery_status: false) }
  scope :delivered, -> { where(delivery_status: true) }
  scope :unseen, -> { where(noticed: nil, delivery_status: false) }

  def self.new_blooper(user, finder, team)
    blooper = create!(
      user_id: user.id,
      finder_id: finder.id,
      doughnut_counter: team.users.count - 1,
      delivery_status: false
    )
    user.update_after_blooper(finder)
    team.update_after_blooper(blooper.doughnut_counter)
  end

  def delivered
    user.team.increment!(:awaiting_doughnuts, (doughnut_counter * -1)).increment!(:eaten_doughnuts, doughnut_counter)
    user.team.users.each do |user|
      user.increment!(:awaiting_doughnuts, -1)
      user.increment!(:eaten_doughnuts, 1)
    end
    user.increment!(:awaiting_doughnuts, 1).increment!(:eaten_doughnuts, -1)
        .increment!(:delivered_doughnuts, doughnut_counter)
    update(delivery_status: true)
  end
end
