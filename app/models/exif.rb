class Exif < ApplicationRecord

	has_one :photo
	belongs_to :camera

end
