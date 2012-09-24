class AddRetrospectedOnToRetrospections < ActiveRecord::Migration
  def change
    add_column :retrospections, :retrospected_on, :date
  end
end
