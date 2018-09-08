class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
# ------------------検索-----------------------------------------------------------

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['name LIKE ?', "%#{search}%"])
    else

    end
  end

# -------------------------------------------------------------------------------
  attachment :thumbnail
  attachment :header_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :photos
  has_many :likes, dependent: :destroy
  has_many :albums
  has_many :post_comments, dependent: :destroy
  has_many :notices, dependent: :destroy

  has_and_belongs_to_many :cameras

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能


# varidetes-----------------------------------

	validates :first_name,
  		presence: true,
  		length: { minimum: 1, maximum: 10}

  validates :last_name,
  		presence: true,
  		length: { minimum: 1, maximum: 10}

  validates :nickname,
  		presence: true,
  		uniqueness: true,
  		length: { in: 2..10 }

end
