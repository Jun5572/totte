class Album < ApplicationRecord
	attachment :image

	belongs_to :user
	has_many :album_items
end
