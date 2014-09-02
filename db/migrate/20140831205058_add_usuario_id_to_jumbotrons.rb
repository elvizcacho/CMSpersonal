class AddUsuarioIdToJumbotrons < ActiveRecord::Migration
  def change
    add_column :jumbotrons, :usuario_id, :integer
  end
end
