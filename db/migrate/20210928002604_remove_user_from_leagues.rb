class RemoveUserFromLeagues < ActiveRecord::Migration[6.1]
  def change
    remove_reference :leagues, :user, null: false, foreign_key: true
  end
end
