class PhotosController < ApplicationController
  def index
    @photos = Photo.all.reverse_order
  end

  def show
  	if User.exists?(id: params[:id])
      @user = User.find(params[:id])
      @photos = @user.photos
    else
    end
  end
end
