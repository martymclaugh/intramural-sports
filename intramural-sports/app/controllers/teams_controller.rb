class TeamsController < ApplicationController
  def index
    @teams = Team.where(league_id: params[:league_id])
    @league = League.find(params[:league_id])
  end

  def show
    @team = Team.find(params[:id])
    @league = League.find(params[:league_id])
  end

end
