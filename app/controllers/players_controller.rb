class PlayersController < ApplicationController
  def new
  end

  def create
    if params[:player][:coach] == "true"
      if params[:player][:sport].capitalize == "Football" || params[:player][:sport].capitalize == "Hockey" || params[:player][:sport].capitalize == "Basketball"
        if params[:player][:password] == params[:player][:password_confirmation]
          player = Player.new(player_params)
        end
        if player.save
          team = Team.create(name: params[:player][:team], league_id: League.find_by(sport: params[:player][:sport].capitalize).id)
          teamplayer = PlayerTeam.create(player_id: player.id, team_id: team.id)
          session[:player_id] = player.id
          redirect_to "/leagues/#{team.league_id}/teams/#{team.id}"
        else
          redirect_to '/signup'
        end
      else
        flash[:notice] = "*Must be 'Football', 'Basketball', or 'Hockey'"
        redirect_to '/signup'
      end
    else
      player = Player.create(name: params[:player][:name], email: params[:player][:email], phone: params[:player][:phone], password: "123", coach: false)
      PlayerTeam.create(player_id: player.id, team_id: params[:player][:team])

      redirect_to "/leagues/#{Team.find(params[:player][:team]).league_id}/teams/#{params[:player][:team]}"
    end
  end

  protected

  def player_params
    params.require(:player).permit(:name, :email, :password, :phone, :coach)
  end
end
