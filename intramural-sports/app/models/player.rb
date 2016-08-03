class Player < ApplicationRecord
  has_many :player_teams
  has_many :teams, through: :player_teams
end
