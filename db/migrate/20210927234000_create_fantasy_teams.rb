class CreateFantasyTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :fantasy_teams do |t|
      t.string :team_name
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
