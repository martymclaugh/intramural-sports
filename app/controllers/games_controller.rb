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

def update
	@game = Game.find(params[:id])
	@league = League.find(Team.find(Game.find(params[:id]).away_id).league_id)
	if @game.update_attributes(home_score: params[:home_score].to_i, away_score: params[:away_score].to_i)
		redirect_to "/leagues/#{@league.id}/games/#{@game.id}"
	end
end


def game_params
	params.require(:team).permit(:home_team, :away_team, :address, :date)
end