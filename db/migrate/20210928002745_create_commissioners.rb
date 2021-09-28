class CreateCommissioners < ActiveRecord::Migration[6.1]
  def change
    create_table :commissioners do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
