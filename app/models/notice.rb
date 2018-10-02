class Notice < ApplicationRecord
	belongs_to :notice_by, class_name: 'User'
	belongs_to :user
	belongs_to :photo
	belongs_to :follow, optional: true
	belongs_to :like, optional: true
	belongs_to :post_comment, optional: true
end
