class MyAlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @photo = Photo.new
    # @user = current_user
    @albums = Album.all.reverse_order
  end

  def new
    if session[:photo] == nil
      session[:photo] = []
    end
    @photo = Photo.new
    @num = 0
    @count = session[:photo].count
    @user = current_user
    @photos = @user.photos.reverse_order
    @album = current_album
      puts session[:photo]
    # @album_items = @album.album_items
  end

# 作成中のアルバムに写真を追加
  def add_album_item
    @album = current_album
    if @album.blank?
      redirect_to user_path(current_user)
    else
      @album_item = AlbumItem.new
      @photo = Photo.find(params[:id])
      # @album_items = @album.album_items.find_by(photo_id: @photo.id)
      if @album_items.blank?
        @album_item.photo_id = @photo.id
        @album_item.album_id = current_album.id
        if @album_item.save
          session[:photo].push(@album_item.photo_id)
          session[:photo] = session[:photo].sort_by{ |u| -u }

          redirect_to new_my_album_path
        else
          redirect_to new_my_album_path
        end
      else
        redirect_to user_path(current_user)
      end
    end
  end

  # 作成中のアルバムから写真を削除
  def del_album_item
    @photo = Photo.find(params[:id])
    @album = current_album
    @album_item = @album.album_items.find_by(photo_id: @photo.id)
    if @album_item.destroy
      session[:photo].delete(@album_item.photo_id)
      # puts 'アルバム写真候補から外れました'
      redirect_to new_my_album_path
    end
  end


  def create
    @album = current_album
    @album_items = @album.album_items

    if @album.save
      session[:album_id] = nil
      session[:photo] = nil
      redirect_to user_albums_path(current_user)
    else
      p "保存できていません"
      redirect_to user_albums_path(current_user)
    end
  end

  def show
    if Album.exists?
      @user = current_user
      @album = Album.find(params[:id])
      @album_items = @album.album_items
    else
    end
  end

  def edit
    @user = current_user
    @album = @user.album
  end

  def update
    @album = Album.find(params[:id])
    if @album.update
      redirect_to my_albums_path
    else
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album_items = @album.album_items
    if @album.destroy
      redirect_to user_albums_path(current_user)
    end
  end


  private

  def album_params
    params.require(:album).permit(:title, :introduction, :thumbnail_id, :user_id, :event_id, :like_count,
                                                                                album_items_attributes:[[:id,
                                                                                                        :albumm_id,
                                                                                                        :photo_id,
                                                                                                        :_destroy]])
  end

  def album_item_params
    params.require(:album_item).permit(:album_id, :photo_id)
  end
end
