class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :home_score
      t.integer :away_score
      t.string :location, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.timestamps
    end
  end
end
