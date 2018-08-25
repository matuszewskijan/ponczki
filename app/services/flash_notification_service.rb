class FlashNotificationService
  include ActionView::Helpers::UrlHelper

  def self.generate_message(user)
    return unless user.team_admin? && !user.team.setted_up
    ActionController::Base.helpers.link_to("Configure your Ponczki app on Slack!",
                                           "/team/tutorial/" + user.team.slack_name).to_s
  end
end
