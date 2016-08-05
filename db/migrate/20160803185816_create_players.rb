class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :phone
      t.string :email, null: false
      t.boolean :coach
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
