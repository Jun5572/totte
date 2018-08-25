class PostComment < ApplicationRecord

	belongs_to :user
	belongs_to :photo
  	has_many :notices, dependent: :destroy


	validates :comment, presence: true
end
