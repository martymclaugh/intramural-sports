class PlayersController < ApplicationController
  def new
  end

  def create
    if params[:player][:password] == params[:player][:password_confirmation]
      player = Player.new(player_params)
    end
    if player.save
      p params[:player][:sport]
      team = Team.create(name: params[:player][:team], league_id: League.find_by(sport: params[:player][:sport]).id)
      p "*" * 100
      p team
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
