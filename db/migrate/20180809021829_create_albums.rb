class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :introduction
      t.string :thumbnail_id
      t.integer :user_id
      t.integer :event_id
      t.integer :like_count, default: 0, null: false

      t.timestamps
    end
  end
end
