class AddPictureToJumbotron < ActiveRecord::Migration
  def change
    add_column :jumbotrons, :picture, :string
  end
end
