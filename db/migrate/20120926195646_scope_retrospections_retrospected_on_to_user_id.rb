class ScopeRetrospectionsRetrospectedOnToUserId < ActiveRecord::Migration
  def up
    remove_index :retrospections, :retrospected_on
    add_index :retrospections, [:user_id, :retrospected_on]
  end

  def down
    remove_index :retrospections, [:user_id, :retrospected_on]
    add_index :retrospections, :retrospected_on
  end
end
