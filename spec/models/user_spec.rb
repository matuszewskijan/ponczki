require "rails_helper"

# include OmniauthHelpers

describe User do
  describe "associations" do
    it { User.reflect_on_association(:bloopers).macro.should eq(:has_many) }
    it { User.reflect_on_association(:team).macro.should eq(:belongs_to) }
  end

  let(:auth) { facebook_hash }

  describe "#self.from_omniauth" do
    context "when user don't exists" do
      it "create new user" do
        expect { described_class.from_omniauth(auth) }.to change { User.count }
      end
    end
    context "when user exists" do
      let!(:auth) { facebook_hash }
      before do
        described_class.from_omniauth(auth)
      end
      it "wont change users count" do
        expect { described_class.from_omniauth(auth) }.not_to change { User.count }
      end
      it "returns user" do
        expect(described_class.from_omniauth(auth)).to eq User.last
      end
    end
  end

  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, :admin) }

  describe "#team_admin?" do
    context "when user is not admin" do
      it "return false" do
        expect(user.team_admin?).to eq false
      end
    end

    context "when user is admin" do
      it "return true" do
        expect(admin_user.team_admin?).to eq true
      end
    end
  end
end
