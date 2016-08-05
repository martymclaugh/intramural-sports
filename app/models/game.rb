class Game < ApplicationRecord
  has_many :team_games, :foreign_key => :game_id
  has_many :teams, through: :team_games, foreign_key: :home_id
  has_many :teams, through: :team_games, foreign_key: :away_id
end
