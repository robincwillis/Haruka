class DropLinksTable < ActiveRecord::Migration
  def up
  	drop_table :links
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
