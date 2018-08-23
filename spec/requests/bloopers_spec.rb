require "rails_helper"

RSpec.describe "Bloopers", type: :request do
  describe "GET /bloopers" do
    it "works! (now write some real specs)" do
      get bloopers_path
      expect(response).to have_http_status(200)
    end
  end
end
