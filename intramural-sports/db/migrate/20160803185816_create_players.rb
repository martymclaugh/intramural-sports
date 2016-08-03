class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.boolean :coach

      t.timestamps
    end
  end
end
