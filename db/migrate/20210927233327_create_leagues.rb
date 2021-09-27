class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.int :team_num
      t.belongs_to :user, null: false, foreign_key: true
      t.int :pg_num
      t.int :sg_num
      t.int :pf_num
      t.int :c_num
      t.int :f_num
      t.int :g_num
      t.int :util_num
      t.int :be_num

      t.timestamps
    end
  end
end
