class AlbumItem < ApplicationRecord
	# attachment :photo


	belongs_to :album
	belongs_to :photo


  	validates :photo, presence: true

end
