class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :title
      t.text :text
      t.string :picture
      t.string :link
      t.integer :thumbnail_group_id

      t.timestamps
    end
  end
end
