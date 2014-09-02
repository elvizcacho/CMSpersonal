class CreateThumbnailGroups < ActiveRecord::Migration
  def change
    create_table :thumbnail_groups do |t|
      t.integer :usuario_id

      t.timestamps
    end
  end
end
