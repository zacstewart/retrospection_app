class AddSearchIndexToRetrospections < ActiveRecord::Migration
  def up
    execute "create index retrospections_body on retrospections using gin(to_tsvector('english', body))"
  end

  def down
    execute "drop index retrospections_body"
  end
end
