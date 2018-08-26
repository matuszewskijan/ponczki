require "rails_helper"

RSpec.describe Team, type: :model do
  let(:auth) { facebook_hash }
  let(:team) { FactoryBot.create(:team) }
  let(:admin_user) { FactoryBot.create(:user, team_admin_id: team.id) }
  let(:not_admin_user) { FactoryBot.create(:user, team_admin_id: 0) }

  describe "#current_user_is_admin?" do
    context "when user is admin of given team" do
      it "return true" do
        expect(team.current_user_is_admin?(admin_user)).to eq true
      end
    end
    context "when user is not admin of given team" do
      it "return false" do
        expect(team.current_user_is_admin?(not_admin_user)).to eq false
      end
    end
  end

  describe "#self.from_omniauth" do
    context "when team doesn't exists" do
      it "create new team" do
        expect { described_class.from_omniauth(auth) }.to change { Team.count }
      end
    end
    context "when team exists" do
      let!(:auth) { facebook_hash }
      before do
        described_class.from_omniauth(auth)
      end
      it "won't change teams count" do
        expect { described_class.from_omniauth(auth) }.not_to change { Team.count }
      end
      it "returns team" do
        expect(described_class.from_omniauth(auth)).to eq Team.last
      end
    end
  end

  let(:user) { FactoryBot.create(:user) }

  describe "#add_user" do
    it "add user to team" do
      expect { team.add_user(user) }.to change { user.team }
    end
    it "increase members_count" do
      expect { team.add_user(user) }.to change { team.members_count }
    end
  end

  describe "#add_admin_user" do
    it "add user to team" do
      expect { team.add_user(user) }.to change { user.team }
    end
    it "increase members_count" do
      expect { team.add_user(user) }.to change { team.members_count }
    end
    it "makes user team admin" do
      expect { team.add_admin_user(user) }.to change { user.team_admin_id }
    end
  end
end
