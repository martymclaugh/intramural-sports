class Team < ApplicationRecord
  belongs_to :league
  has_many :player_teams
  has_many :team_games, :foreign_key => :home_id
  has_many :team_games, :foreign_key => :away_id
  has_many :games, through: :team_games
  has_many :players, through: :player_teams
end
