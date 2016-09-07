class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @home_team = Team.find(TeamGame.find_by(game_id: @game.id).home_id)
    @away_team = Team.find(TeamGame.find_by(game_id: @game.id).away_id)
    @league = League.find(@home_team.league_id)
  end

  def edit
  end

  def new
    @team = Team.find_by(id: PlayerTeam.find_by(player_id: current_user.id).team_id)
    if request.xhr?
      if params[:game][:home_team]
        @home_team = Team.find_by(name: params[:game][:home_team])
        if @home_team != @team
          respond_to do |format|
            format.json { render json: [@team.name] }
          end
        end
      elsif params[:game][:away_team]
        @away_team = Team.find_by(name: params[:game][:away_team])
        if @away_team != @team
          respond_to do |format|
            format.json { render json: [@team.name] }
          end
        end
      end
    end
  end

  def create
    home_team = Team.find_by(name: params[:game][:home_team])
    away_team = Team.find_by(name: params[:game][:away_team])
    @game = Game.create(location: params[:game][:address], date: DateTime.now, home_score: 0, away_score: 0)
    @team_game = TeamGame.create(away_id: away_team.id, home_id: home_team.id, game_id: @game.id)
    @league = League.find(home_team.league_id)
      if @game.valid?
        send_text_message(home_team, away_team, @game.location, @game.date)
        redirect_to "/leagues/#{@league.id}/games/#{@game.id}"
      else
        redirect_to "/leagues/#{@league.id}/teams/#{home_team.id}"
      end
  end

  def update
    @game = Game.find(params[:id])
    @home_team = Team.find(TeamGame.find_by(game_id: @game.id).home_id)
    @league = League.find(@home_team.league_id)
    if @game.update_attributes(home_score: params[:home_score].to_i, away_score: params[:away_score].to_i)
      redirect_to "/leagues/#{@league.id}/games/#{@game.id}"
    end
  end

  def send_text_message(home_team, away_team, location, date)
    game_players = home_team.players + away_team.players
    numbers_to_send_to = []
    game_players.each do |player|
      numbers_to_send_to << player.phone
    end
    twilio_body = "#{home_team.name} VS #{away_team.name} located at: #{location} Game starts at: #{date}. Be there or B^2!"

    twilio_sid = ENV['TWILIO_ACCOUNT_SID']
    twilio_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_phone_number = ENV['TWILIO_NUMBER']

    #UNCOMMENT WHEN READY TO USE

    # @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    # numbers_to_send_to.each do |number|
    #   @twilio_client.account.sms.messages.create(
    #     :from => twilio_phone_number,
    #     :to => number,
    #     :body => twilio_body
    #     )
    # end
  end
end
