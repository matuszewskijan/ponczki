class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @team = Team.from_omniauth(request.env["omniauth.auth"])
    sign_in @user
    redirect_to become_team_admin_path && return unless @team.admin
    redirect_to user_path(@user.id)
  end
end
