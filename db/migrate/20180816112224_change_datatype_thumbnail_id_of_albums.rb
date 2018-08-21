class ChangeDatatypeThumbnailIdOfAlbums < ActiveRecord::Migration[5.2]
  def change
  	change_column :albums, :thumbnail_id, :integer
  end
end
