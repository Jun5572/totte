class Notice < ApplicationRecord
	belongs_to :notice_by, class_name: 'User'
	belongs_to :user
	belongs_to :photo
	belongs_to :follow, optional: true
	has_one :like
	has_one :post_comment
end
