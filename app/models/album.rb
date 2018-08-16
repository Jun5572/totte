class Album < ApplicationRecord
	attachment :thumbnail
	attachment :image

	belongs_to :user
	has_many :photos, through: :album_items
	has_many :album_items, dependent: :destroy, inverse_of: :album
	accepts_nested_attributes_for :album_items, allow_destroy: true


	
end
