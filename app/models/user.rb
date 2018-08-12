class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attachment :thumbnail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :photos
  has_many :likes
  has_many :albums
 	# validates :first_name,
  		# presence:true
  		# length: { minimum: 1, maximum: 10}

  	# validates :last_name,
  		# presence:true
  		# length: { minimum: 1, maximum: 10}
end
