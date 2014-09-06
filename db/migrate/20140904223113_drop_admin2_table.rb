class DropAdmin2Table < ActiveRecord::Migration
  def up
    drop_table :admin
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
