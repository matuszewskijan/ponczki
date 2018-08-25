class ApplicationController < ActionController::Base
  before_action :show_alerts

  def show_alerts
    return unless user_signed_in?
    flash[:alert] = FlashNotificationService.generate_message(current_user)
  end
end
