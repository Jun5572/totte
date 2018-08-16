class Camera < ApplicationRecord
	attachment :image


	has_many :users
	has_many :photos
	has_many :exifs
end
