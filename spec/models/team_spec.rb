require "rails_helper"

RSpec.describe Team, type: :model do
  let(:auth) { facebook_hash }

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
end
