class Photo < ApplicationRecord
	attachment :image


	belongs_to :user
	has_many :album_items, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :albums, through: :album_items
  has_many :likes, dependent: :destroy
  has_many :notices, dependent: :destroy


# １つ前の画像を呼び出すメソッド
    def pre
      # Photo.order(created_at: :desc, id: :desc).where("created_at<=? and id<?", created_at, id).first
      user.photos.order(created_at: :desc, id: :desc).where("created_at<=? and id<?", created_at, id).first
    end
# 次の画像を呼び出すメソッド
    def next
      # Photo.order(created_at: :desc, id: :desc).where("created_at>=? and id>?", created_at, id).reverse.first
      user.photos.order(created_at: :desc, id: :desc).where("created_at>=? and id>?", created_at, id).reverse.first
    end



  # いいね！
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
