class ApplicationController < ActionController::Base
  before_action :show_alerts

  def show_alerts
    return unless user_signed_in?
    return unless current_user.team_admin? && !current_user.team.settled_up
    flash[:success] = view_context.link_to("Configure your Ponczki app on Slack!",
                                           "/team/tutorial/" + current_user.team.slack_name).to_s
  end
end
