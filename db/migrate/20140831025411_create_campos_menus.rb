class CreateCamposMenus < ActiveRecord::Migration
  def change
    create_table :campos_menus do |t|
      t.integer :menu_id
      t.string :controller
      t.string :action
      t.string :text

      t.timestamps
    end
  end
end
