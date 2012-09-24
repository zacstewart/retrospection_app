class AddUserIdToSleeps < ActiveRecord::Migration
  def change
    add_column :sleeps, :user_id, :integer
    add_index :sleeps, :user_id
  end
end
