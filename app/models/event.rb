class Event < ApplicationRecord
	# attachment :image

	has_many :photos
	has_many :interests
	has_one :place

end

