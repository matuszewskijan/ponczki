require "rails_helper"

RSpec.describe Blooper, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:team) { FactoryBot.create(:team) }
  let(:finder) { FactoryBot.create(:user, slack_id: Array.new(9) { rand(10) }) }

  describe "self.new_blooper" do
    before do
      described_class.new_blooper(user, finder, team)
    end
    subject { Blooper.last }
    it { expect(subject.user_id).to eq user.id }
    it { expect(subject.finder_id).to eq finder.id }
    it { expect(subject.doughnut_counter).to eq team.users.count - 1 }
  end

  describe "update_users_and_team" do
  end
end
