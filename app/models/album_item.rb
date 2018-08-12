class AlbumItem < ApplicationRecord
	attachment :image


	belongs_to :album
	belongs_to :photo
end
