class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.datetime :slept_at
      t.datetime :woke_at

      t.timestamps
    end
  end
end
