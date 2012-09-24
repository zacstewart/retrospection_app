class AddUserIdToRetrospections < ActiveRecord::Migration
  def change
    add_column :retrospections, :user_id, :integer
    add_index :retrospections, :user_id
  end
end
