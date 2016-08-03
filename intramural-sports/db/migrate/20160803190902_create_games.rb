class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :home_score
      t.integer :away_score
      t.string :location, null: false
      t.datetime :date, null: false
      t.integer :home_id
      t.integer :away_id

      t.timestamps
    end
  end
end
