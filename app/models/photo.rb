class Photo < ApplicationRecord
	attachment :image


	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :album_items
end
