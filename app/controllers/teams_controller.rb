class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :become_admin]

  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/1
  def show
    puts @team.current_user_is_admin?(current_user)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: "Team was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /teams/1
  def update
    @team = Team.find_by(slack_name: team_params["slack_name"])
    if team_params["admin"]
      @team.owner_id = current_user.id
      @team.add_admin_user(current_user)
      @team.description = team_params["description"]
      @team.save
      redirect_to(team_setup_tutorial_path(@team.slack_name)) && return
    elsif @team.update(team_params)
      redirect_to @team, notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to teams_url, notice: "Team was successfully destroyed."
  end

  def become_admin; end

  def setup; end

  private

  def set_team
    @team = Team.find_by(slack_name: params[:name])
  end

  # Only allow a trusted parameter "white list" through.
  def team_params
    params.require(:team).permit(:name, :description, :owner_id, :eaten_doughnuts, :admin,
                                 :awaiting_doughnuts, :slack_url, :slack_name)
  end
end
