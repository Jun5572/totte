class Camera < ApplicationRecord
	# attachment :image


	has_and_belongs_to_many :users
	has_many :photos
	has_many :exifs
end
