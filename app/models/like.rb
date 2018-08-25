class Like < ApplicationRecord
	belongs_to :user
	belongs_to :photo
 	# has_many :notices, dependent: :destroy
end
