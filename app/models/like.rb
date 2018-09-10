class Like < ApplicationRecord
	belongs_to :user
	belongs_to :photo, optional: true, counter_cache: :like_count
 	# has_many :notices, dependent: :destroy
end
