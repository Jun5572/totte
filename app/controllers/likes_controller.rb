class LikesController < ApplicationController
	# https://rails-school.net/rails-likes-button/ 参照 --------------------------
# 	def create
# 	@photo = Photo.find(params[:photo_id])
# 	@like = Like.create(user_id: current_user.id, photo_id: @photo.id)
# 	@like_hash = {}
# 	binding.pry
# 	# @like_hash[@youtube_like.id] = @youtube.id

# 	respond_to do |format|
# 		format.html
# 		format.js
# 	end
#  end

# def destroy
# 	@photo = Photo.find(params[:photo_id])
# 	like = Like.find_by(user_id: current_user.id, photo_id: @photo.id)
# 	like.destroy
# 	@like_hash = {}

# 	respond_to do |format|
# 		format.html
# 		format.js
# 	end
#  end
# ----------------------------------------------------------------------------
 before_action :set_variables


	def create
		@photo = Photo.find(params[:photo_id])
		@like = current_user.likes.new(photo_id: @photo.id)
		if @like.save
			# redirect_to user_path(@photo.user)
			render partial: 'users/likes', locals: { photo: @photo }
		else
			puts 'いいねされていない'
		end
  	end


  	def destroy
  		@photo = Photo.find(params[:photo_id])
		@like = current_user.likes.find_by(photo_id: params[:photo_id])
		binding.pry
		if @like.destroy
			# redirect_to user_path(@photo.user)
			render partial: 'users/likes', locals: { photo: @photo }
		else
			puts 'いいね削除失敗'
		end
  	end
end

private

def like_params
	params.require(:like).permit(:user_id, :photo_id)
end

   def set_variables
     @photo = Photo.find(params[:photo_id])
   end

# ==========================================================================

# def create

#   favorite = Favorite.new(blog_id: @blog.id, user_id: current_user.id)
 
#   favorite.save
#   # @favorite = Favorite.create(user_id: current_user.id, blog_id: params[:blog_id])
#   @favorites = Favorite.where(blog_id: params[:blog_id])
#   # @blogs = Blog.all
# end

# def destroy
#   favorite = Favorite.find_by(blog_id: @blog.id, user_id: current_user.id)
#   favorite.destroy
#   # favorite = Favorite.find_by(user_id: current_user.id, blog_id: params[:blog_id])
#   # favorite.destroy
#   @favorites = Favorite.where(blog_id: params[:blog_id])
#   # @blogs = Blog.all
# end