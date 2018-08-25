class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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


# varidetes-----------------------------------

	# validates :first_name,
 #  		presence: true,
 #  		length: { minimum: 1, maximum: 10}

 #  validates :last_name,
 #  		presence: true,
 #  		length: { minimum: 1, maximum: 10}

 #  varidates :nickname,
 #  		presence: true,
 #  		uniqueness: true,
 #  		length: { in: 2..12 }

end
