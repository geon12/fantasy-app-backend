class CreateTeamPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_players do |t|
      t.belongs_to :fantasy_team, null: false, foreign_key: true
      t.belongs_to :player, null: false, foreign_key: true
      t.boolean :bench
      t.boolean :utility

      t.timestamps
    end
  end
end
