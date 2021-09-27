class CreatePlayerPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :player_positions do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
