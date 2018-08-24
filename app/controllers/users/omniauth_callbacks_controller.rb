class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @team = Team.from_omniauth(request.env["omniauth.auth"])
    sign_in @user
    redirect_to become_team_admin_path(@team.slack_name) if @team.admin.nil?
    redirect_to user_path(@user.id) unless @team.admin.nil?
  end
end
