class DropPlayerPositions < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :player_positions
    end
  
    def down
      fail ActiveRecord::IrreversibleMigration
    end
  end
end
