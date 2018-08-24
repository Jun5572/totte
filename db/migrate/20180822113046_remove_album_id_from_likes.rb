class RemoveAlbumIdFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :album_id, :integer
  end
end
