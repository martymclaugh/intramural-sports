class CreatePlayerTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :player_teams do |t|
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
  end
end
