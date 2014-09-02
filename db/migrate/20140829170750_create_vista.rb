class CreateVista < ActiveRecord::Migration
  def change
    create_table :vista do |t|
      t.string :cuadro

      t.timestamps
    end
  end
end
