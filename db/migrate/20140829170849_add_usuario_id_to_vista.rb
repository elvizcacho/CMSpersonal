class AddUsuarioIdToVista < ActiveRecord::Migration
  def change
    add_column :vista, :usuario_id, :integer
  end
end
