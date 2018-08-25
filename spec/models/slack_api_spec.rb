require "rails_helper"

RSpec.describe SlackApi, type: :model do
  before(:each) do
    User.delete_all
    Team.delete_all
  end
  let(:api_hash) { FactoryBot.attributes_for(:slack_api).stringify_keys }
  describe "self.validate_user" do
    context "when user doesn't exists" do
      it "return message" do
        expect(described_class.validate_user(api_hash["user_id"])).to include "you don't have account on"
      end
    end

    context "when user exsits" do
      it "return user" do
        user = FactoryBot.create(:user, slack_id: api_hash["user_id"])
        expect(described_class.validate_user(api_hash["user_id"])).to eq user
      end
    end
  end

  describe "self.validate_team" do
    context "when team doesn't exists" do
      it "return message" do
        expect(described_class.validate_team(api_hash["team_id"])).to include "Your team doesn't exsits"
      end
    end

    context "when user exsits" do
      it "return team" do
        team = FactoryBot.create(:team, slack_id: api_hash["team_id"])
        expect(described_class.validate_team(api_hash["team_id"])).to eq team
      end
    end
  end
  let(:user) { FactoryBot.create(:user, slack_id: api_hash["user_id"]) }
  let(:team) { FactoryBot.create(:team, slack_id: api_hash["team_id"]) }
  describe "self.process_params" do
    context "setup parameter passed" do
      it "flag your team as setted up" do
        expect { described_class.process_params("setup", user, team) }.to change { team.setted_up }
      end
      it "respond with success information" do
        expect(described_class.process_params("setup", user, team)).to include "Yay! Everything works fine"
      end
    end
    context "help parameter passed" do
      it "inform that help doesn't work yet" do
        expect(described_class.process_params("help", user, team)).to include "Help doesn't work at this time"
      end
    end
    context "finder nickname passed" do
      it "call #process_params" do
        # expect { described_class.process_params("@user", user, team) }.to
        # call(described_class.new_blooper(user, user, team))
      end
    end
    context "something else passed" do
      it "inform that you need to tag yourself" do
        expect(described_class.process_params("", user, team)).to include "use this command /ponczki @your_nickname"
      end
    end
  end

  let(:finder) { FactoryBot.create(:user, slack_id: Array.new(9) { rand(10) }) }
  describe "self.new_blooper" do
    context "finder doesn't exists" do
      it "inform that you have to register" do
        expect(described_class.new_blooper(user, nil, team)).to eq "You have to register at Ponczki!"
      end
    end
    context "user team doesn't match finder team" do
      it "inform that users has to be in the same team" do
        finder.team_id = 0
        expect(described_class.new_blooper(user, finder, team)).to eq "You both have to be members of the same team!"
      end
    end
    context "user and finder are in the same team" do
      after do
        Blooper.delete_all
      end
      subject { described_class.new_blooper(user, finder, team) }
      it { expect(Blooper.count).to eq 2 }
      it { expect(team.awaiting_doughnuts).to eq 1 }
    end
  end

  describe "self.response_with_text" do
    it "calls slack api and raise error" do
      expect { described_class.response_with_text("It will be displayed on slack", api_hash["response_url"]) }
        .to raise_error(RestClient::NotFound)
    end
  end

  # describe "self.response_with_json" do; end
end
