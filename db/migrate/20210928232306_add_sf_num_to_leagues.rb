class AddSfNumToLeagues < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :sf_num, :integer
  end
end
