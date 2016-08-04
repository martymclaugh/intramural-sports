class GamesController < ApplicationController

	def index

		@games = Game.all

	end


	def show
		@game = Game.find(params[:id])
		@home_team = Team.find(@game.home_id)
		@away_team = Team.find(@game.away_id)
		@league = League.find(Team.find(@game.away_id).league_id)
	end


	def edit


	end


	def new

	end

	def create

	end

end

protected

def game_params
	params.require(:team).permit(:home_team, :away_team, :address, :date)
end