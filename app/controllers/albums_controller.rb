class AlbumsController < ApplicationController

	def index
		@albums = Album.all.reverse_order
	end

	def show
		if User.exists?(id: params[:id])
	  		@user = User.find(params[:id])
	  		@albums = @user.albums.reverse_order
  		else
  		end
	end
end
