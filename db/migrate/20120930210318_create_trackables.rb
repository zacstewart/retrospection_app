class CreateTrackables < ActiveRecord::Migration
  def change
    create_table :trackables do |t|
      t.references :user
      t.string :name
      t.string :unit

      t.timestamps
    end
    add_index :trackables, :user_id
  end
end
