class Team < ApplicationRecord
  has_many :player_teams
  has_many :games, foreign_key: :home_id
  has_many :games, foreign_key: :away_id
  has_many :players, through: :player_teams
end
