class PlayersController < ApplicationController
  def new
  end

  def create
    p player_params
    p "*" * 100
    if params[:player][:password] == params[:player][:password_confirmation]
      player = Player.new(player_params)
    end
    if player.save
      team = Team.find_by(name: params[:player][:team])
      teamplayer = PlayerTeam.create(player_id: player.id, team_id: team.id)
      session[:player_id] = player.id
      redirect_to "/leagues/#{team.league_id}"
    else
      redirect_to '/signup'
    end
  end

  protected

  def player_params
    params.require(:player).permit(:name, :email, :password, :phone, :coach)
  end
end
