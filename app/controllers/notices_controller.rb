class NoticesController < ApplicationController

	def index
		@notices = current_user.notices
	end


	def link_through
		@notice = Notice.find(params[:id])
		if @notice.update(read: true)
			redirect_to user_photo_path(@notice.user_id, @notice.photo_id)
		else
			puts 'aaa'
		end
	end
end
