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
		home_team = Team.find_by(name: params[:game][:home_team])
		away_team = Team.find_by(name: params[:game][:away_team])
		p @game = Game.create!(location: params[:game][:address], date: params[:game][:date], home_score: 0, away_score: 0)
		p @team_game = TeamGame.create(away_id: away_team.id, home_id: home_team.id)

		p @game.valid?
		p "*" *100
		p @game
		@league = League.find(Team.find(@game.away_id).league_id)
		if @game.valid?
			redirect_to "/leagues/#{@league.id}/games/#{@game.id}"
		else
			redirect_to "/leagues/#{@league.id}/teams/#{home_team.id}"
		end
	end

def update
	@game = Game.find(params[:id])
	@league = League.find(Team.find(Game.find(params[:id]).away_id).league_id)
	if @game.update_attributes(home_score: params[:home_score].to_i, away_score: params[:away_score].to_i)
		redirect_to "/leagues/#{@league.id}/games/#{@game.id}"
	end
end



end
