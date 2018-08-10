class CreateAlbumItems < ActiveRecord::Migration[5.2]
  def change
    create_table :album_items do |t|
      t.integer :album_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
