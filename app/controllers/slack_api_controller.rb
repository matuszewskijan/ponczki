# frozen_string_literal: true

class SlackApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:bloop]
  layout false

  def bloop
    RestClient.post params["response_url"], { text: "http://2ebfd9c7.ngrok.io" }.to_json,
                    content_type: "application/json"
  end
end
