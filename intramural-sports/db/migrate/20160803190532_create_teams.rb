class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :league_id, null: false

      t.timestamps
    end
  end
end
