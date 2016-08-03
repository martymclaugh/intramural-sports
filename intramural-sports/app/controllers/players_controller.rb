class PlayersController < ApplicationController
  def new
  end

  def create
    player = Player.new(player_params)
    if player.save
      session[:player_id] = player.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :team, :password_confirmation, :phone, :coach)
  end
end
