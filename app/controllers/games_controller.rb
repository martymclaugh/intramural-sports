class GamesController < ApplicationController

	def index

		@games = Game.all
	p "=" * 100
    p params
    p "=" * 100

	end


	def show
		@game = Game.find(params[:id])
		@home_team = Team.find(@game.home_id)
		@away_team = Team.find(@game.away_id)
		@league = League.find(Team.find(@game.away_id).league_id)
	p "=" * 100
    p params
    p "=" * 100
	end


	def edit


	end


	def new

	end

	def create
		p "$" * 150
		p params
		home_team = Team.find_by(name: params[:game][:home_team])
		away_team = Team.find_by(name: params[:game][:away_team])
		# @game = Game.create(game_params)
		@game = Game.create(home_id: home_team.id, away_id: away_team.id, location: params[:game][:address], date: params[:game][:date], home_score: 0, away_score: 0)
		p @game
		@league = League.find(Team.find(@game.away_id).league_id)
		redirect_to "/leagues/#{@league.id}/games/#{@game.id}"
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
end

