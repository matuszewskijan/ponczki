# frozen_string_literal: true

class SlackApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:listen]
  layout false

  def listen
    user = SlackApi.validate_user(params["user_id"])
    SlackApi.response_with_text(user, params["response_url"]) && return if user.is_a?(String)

    team = SlackApi.validate_team(params["team_id"])
    SlackApi.response_with_text(team, params["response_url"]) && return if team.is_a?(String)

    respond_text = SlackApi.process_params(params["text"], user, team)
    RestClient.post params["response_url"], { text: respond_text }.to_json,
                    content_type: "application/json"
  end
end
