class AddRetrospectedOnIndexToRetrospections < ActiveRecord::Migration
  def change
    add_index :retrospections, :retrospected_on, unique: true
  end
end
