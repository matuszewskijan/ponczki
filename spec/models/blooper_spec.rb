require "rails_helper"

RSpec.describe Blooper, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:team) { user.team }
  let(:finder) { FactoryBot.create(:user, team: user.team) }

  describe "self.new_blooper" do
    describe "creating new blooper" do
      before do
        described_class.new_blooper(user, finder, team)
      end
      subject { Blooper.last }
      it { expect(subject.user_id).to eq user.id }
      it { expect(subject.finder_id).to eq finder.id }
      it { expect(subject.doughnut_counter).to eq user.team.users.count - 1 }
    end

    describe "callbacks" do
      subject { described_class.new_blooper(user, finder, team) }
      it { expect(user.awaiting_doughnuts).to eq 0 }
      it { expect { subject }.not_to change { finder.awaiting_doughnuts } }
      it { expect { subject }.to change { user.bloopers_count } }
      it { expect { subject }.to change { team.awaiting_doughnuts } }
      it { expect { subject }.to change { finder.findings_count } }
    end
  end

  let(:blooper) { FactoryBot.create(:blooper) }
  let(:team) { blooper.user.team }
  let(:user) { blooper.user }
  describe "#delivered" do
    subject { blooper.delivered }
    it { expect { subject }.to change { team.awaiting_doughnuts } }
    it { expect(team.eaten_doughnuts).to eq 1 }
    it { expect { subject }.to change { team.users.first.awaiting_doughnuts } }
    it { expect { subject }.to change { team.users.first.eaten_doughnuts } }
    it { expect { subject }.to change { user.awaiting_doughnuts & user.eaten_doughnuts & user.delivered_doughnuts } }
    it { expect { subject }.to change { blooper.delivery_status } }
  end
end
