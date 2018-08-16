class MyAlbumItemsController < ApplicationController
  def new
    # @photo = Photo.new
    @album = Album.new
    @album_item = Album_item.new
  end

  def create
    @album_item = Album_item.new
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
