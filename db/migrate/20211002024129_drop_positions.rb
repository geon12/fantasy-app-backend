class DropPositions < ActiveRecord::Migration[6.1]
  def change
    def change
      def up
        drop_table :positions
      end
    
      def down
        fail ActiveRecord::IrreversibleMigration
      end
    end
  end
end
