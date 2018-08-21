class AlbumItem < ApplicationRecord
	# attachment :photo


	belongs_to :album
	belongs_to :photo
end
