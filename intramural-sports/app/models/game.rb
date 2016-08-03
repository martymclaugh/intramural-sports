class Game < ApplicationRecord
  belongs_to :teams
  belongs_to :home, :class_name => "Team", foreign_key: :home_id
  belongs_to :away, :class_name => "Team", foreign_key: :away_id
end
