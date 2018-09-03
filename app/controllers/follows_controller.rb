class FollowsController < ApplicationController

	after_action :create_follow_notice, only: [:create]

	def create #フォローする
		@give_user = current_user
		@get_user = User.find(params[:user_id])
		if @give_user.follow(@get_user)
			redirect_to user_path(@get_user)
		else
			puts "フォロー失敗"
			redirect_to user_path(@get_user)
		end
	end

	def destroy #フォロー解除
		following = current_user
		followed = User.find(params[:user_id])
		if following.stop_following(followed)
			puts "フォロー解除成功"
			redirect_to user_path(followed)
		else
			puts "フォロー解除失敗"
			redirect_to user_path(followed)
		end
	end



	private

		def create_follow_notice
			return if @get_user == current_user
				@user = User.find(params[:user_id])
				Notice.create( user_id: @user.id, notice_by_id: current_user.id, photo_id: 0.to_i, notice_type: "フォロー" )
		end

		def follow_params
			params.require(:follow).permit(:user_id, :notice_by_id, :notice_type)
		end
end
