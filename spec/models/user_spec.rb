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
        puts auth.inspect
        puts "asd"
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
end
