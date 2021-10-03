class RemoveFNumFromLeagues < ActiveRecord::Migration[6.1]
  def change
    remove_column :leagues, :f_num, :integer
  end
end
