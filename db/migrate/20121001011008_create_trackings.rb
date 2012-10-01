class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.references :trackable
      t.float :quantity

      t.timestamps
    end
    add_index :trackings, :trackable_id
  end
end
