class TeamGame < ApplicationRecord
  belongs_to :team, :class_name => "Team", foreign_key: :home_id
  belongs_to :team, :class_name => "Team", foreign_key: :away_id
  belongs_to :game
end
