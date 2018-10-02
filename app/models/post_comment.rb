class PostComment < ApplicationRecord

	belongs_to :user
	belongs_to :photo
  	has_many :notices
  	# has_one :notice


	validates :comment, presence: true, length: { minimum: 2, maximum: 100 }
end
