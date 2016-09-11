class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :home_score
      t.integer :away_score
      t.string :address
      t.date :date, null: false
      t.string :time, null: false

      t.timestamps
    end
  end
end
