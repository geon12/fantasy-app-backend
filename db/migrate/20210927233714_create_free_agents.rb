class CreateFreeAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :free_agents do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
