class LikesController < ApplicationController

# ----------------------------------------------------------------------------
	before_action :set_variables
	after_action :create_notice, only: [:create]


	def create
		@photo = Photo.find(params[:photo_id])
		@user = @photo.user
		@like = current_user.likes.new(photo_id: @photo.id)
		if @like.save
			# jsファイルを呼び出す記述
			respond_to do |format|
		      format.js
		    end
		else
			puts 'いいねされていない'
		end
  	end


  	def destroy
  		@photo = Photo.find(params[:photo_id])
  		@user = @photo.user
		@like = current_user.likes.find_by(photo_id: params[:photo_id])
		if @like.destroy
			# jsファイルを呼び出す記述
			respond_to do |format|
		      format.js
		    end
		else
			puts 'いいね削除失敗'
		end
  	end
end

private


def create_notice
		return if @photo.user_id == current_user.id
			Notice.create(user_id: @photo.user_id,
							notice_by_id: current_user.id,
							photo_id: @photo.id,
							notice_type: 'いいね！')
end


def like_params
	params.require(:like).permit(:user_id, :photo_id)
end

   def set_variables
     @photo = Photo.find(params[:photo_id])
   end

# ==========================================================================
