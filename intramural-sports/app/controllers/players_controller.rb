class PlayersController < ApplicationController
  def new
  end

  def create
    if params[:player][:password] == params[:player][:password_confirmation]
      player = Player.new(player_params)
      player.coach = true
    end
    if player.save
      team = Team.create(name: params[:player][:team], league_id: League.find_by(sport: params[:player][:sport]).id)
      teamplayer = PlayerTeam.create(player_id: player.id, team_id: team.id)
      session[:player_id] = player.id
      redirect_to "/leagues/#{team.league_id}/teams/#{team.id}"
    else
      redirect_to '/signup'
    end
  end

  protected

  def player_params
    params.require(:player).permit(:name, :email, :password, :phone, :coach)
  end
end
