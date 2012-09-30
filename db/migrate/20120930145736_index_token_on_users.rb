class IndexTokenOnUsers < ActiveRecord::Migration
  def up
    add_index :users, :token, unique: true
  end

  def down
    remove_index :users, :token
  end
end
