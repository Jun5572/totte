class Photo < ApplicationRecord
	attachment :image


	belongs_to :user
	has_many :album_items, dependent: :destroy
  has_many :albums, through: :album_items
  has_many :likes, dependent: :destroy


# １つ前の画像を呼び出すメソッド
    def pre
      Photo.order(created_at: :desc, id: :desc).where(" created_at<=? and id<?", created_at, id).first
    end
# 1つ後ろの画像を呼び出すメソッド
    def next
      Photo.order(created_at: :desc, id: :desc).where(" created_at>=? and id>?", created_at, id).reverse.first
    end
end
