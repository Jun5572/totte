class ChangeDatatypeThumbnailIdOfAlbums2 < ActiveRecord::Migration[5.2]
  def change
  	change_column :albums, :thumbnail_id, :string
  end
end
