class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.float :fppg
      t.string :nba_team
      t.boolean :active
      t.string :image_url

      t.timestamps
    end
  end
end
