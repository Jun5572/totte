class NoticesController < ApplicationController

	after_action :check_follow, only: [:link_through]

		def index
			@notices = current_user.notices
		end

		def link_through
			@notice = Notice.find(params[:id])
			if @notice.update(read: true)
				if @notice.notice_type == "コメント" || @notice.notice_type == "いいね！"
					redirect_to user_photo_path(@notice.user_id, @notice.photo_id)
				elsif @notice.notice_type == "フォロー"
					puts "bbb"
					redirect_to user_path(@notice.notice_by)
				end
			else
				puts "aaa"
			end
		end

	private

		def check_follow #通知からユーザーをフォローバックした場合のアクション
			return if @notice.notice_type == "コメント" || @notice.notice_type == "いいね！"
				# @give_user = current_user
				# @get_user = @notice.notice_by
					# @notice.update(read: true)
				current_user.follow(@notice.notice_by)
		end
end
