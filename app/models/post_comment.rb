class PostComment < ApplicationRecord

	belongs_to :user
	belongs_to :photo
  	has_many :notices, dependent: :destroy


	validates :comment, presence: true, length: { minimum: 2, maximum: 20 }
end
