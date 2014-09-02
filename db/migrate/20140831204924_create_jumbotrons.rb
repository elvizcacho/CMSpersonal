class CreateJumbotrons < ActiveRecord::Migration
  def change
    create_table :jumbotrons do |t|
      t.string :title
      t.text :text
      t.binary :picture

      t.timestamps
    end
  end
end
