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
				else
					redirect_to user_path(@notice.notice_by)
				end
			else
			end
		end

	private

		def check_follow #通知からユーザーをフォローバックした場合のアクション
			return if @notice.notice_type != "フォロー"
				@give_user = current_user
				@get_user = @notice.notice_by
					# @notice.update(read: true)
				if @give_user.follow(@get_user)
				else
				end
		end
end
