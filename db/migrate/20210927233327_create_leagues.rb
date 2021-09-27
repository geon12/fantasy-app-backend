class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :team_num
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :pg_num
      t.integer :sg_num
      t.integer :pf_num
      t.integer :c_num
      t.integer :f_num
      t.integer :g_num
      t.integer :util_num
      t.integer :be_num

      t.timestamps
    end
  end
end
