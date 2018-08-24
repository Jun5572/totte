class PostCommentsController < ApplicationController

	after_action :create_notice, only: [:create]

	def create
		# user = User.find(params[:user_id])
		@photo = Photo.find(params[:photo_id])
		@user = @photo.user
		@comment = current_user.post_comments.new(post_comment_params)
		@comment.photo_id = @photo.id
		@comment.user_id = current_user.id
		if @comment.save(post_comment_params)
			render partial: 'photos/comments', locals: { photo: @photo, user: @user }
		else
		end
	end

	def destroy
		photo = Photo.find(params[:photo_id])
		user = photo.user
		comment = PostComment.find(params[:id])
		if comment.destroy
			# redirect_to user_photo_path(user, photo)
			render partial: 'photos/comments', locals: { photo: @photo, user: @user }
		else
		end
	end


	private

	def create_notice
		return if @photo.user_id == current_user.id
			Notice.create(user_id: @photo.user_id,
							notice_by_id: current_user.id,
							photo_id: @photo.id,
							notice_type: 'コメント')
	end


	def post_comment_params
		params.require(:post_comment).permit(:user_id, :photo_id, :comment)
	end
end
