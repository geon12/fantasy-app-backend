class RemoveGNumFromLeagues < ActiveRecord::Migration[6.1]
  def change
    remove_column :leagues, :g_num, :integer
  end
end
