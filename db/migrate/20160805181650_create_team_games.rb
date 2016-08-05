class CreateTeamGames < ActiveRecord::Migration[5.0]
  def change
    create_table :team_games do |t|
      t.integer :away_id
      t.integer :home_id
      t.integer :game_id
      t.timestamps
    end
  end
end
