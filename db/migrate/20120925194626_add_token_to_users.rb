class AddTokenToUsers < ActiveRecord::Migration
  def up
    add_column :users, :token, :string, limit: 16
  end

  def down
    remove_column :users, :token
  end
end
