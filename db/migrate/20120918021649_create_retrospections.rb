class CreateRetrospections < ActiveRecord::Migration
  def change
    create_table :retrospections do |t|
      t.text :body

      t.timestamps
    end
  end
end
