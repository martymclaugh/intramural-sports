class TeamsController < ApplicationController
  def index
    @teams = Team.where(league_id: params[:league_id])
    @league = League.find(params[:league_id])
    p "=" * 100
    p params
    p "=" * 100

  end

  def show
    @team = Team.find(params[:id])
    @league = League.find(params[:league_id])
    p "=" * 100
    p params
    p "=" * 100
    # @game = Game.find()
  end
end
