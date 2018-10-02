class AlbumsController < ApplicationController
  before_action :authenticate_user!
	def new
    @user = current_user
    @photos = @user.photos.reverse_order
    @album = current_album
    # binding.pry
  end

  def index
    @photo = Photo.new
    @user = User.find(params[:user_id])
    @albums = current_user.albums.reverse_order
    @albums_cnt = @albums.count
    @likes_count = Photo.where(user_id: @user.id).pluck(:like_count).sum
  end

  def add_album_item
    @album_item = AlbumItem.new
    @photo = Photo.find(params[:id])
    @album = current_album
    @album_items = @album.album_items.find_by(photo_id: @photo.id)
    if @album_items.blank?
      @album_item.photo_id = @photo.id
      @album_item.album_id = current_album.id
      if @album_item.save
        puts "保存に成功しました"
        redirect_to new_my_album_path
      else
        puts "保存されていません"
        redirect_to new_my_album_path
      end
    else
      puts "既に追加されてる写真です"
      redirect_to new_my_album_path
    end

  end

  def create
    @album = current_album
    @album_items = @album.album_items
    if @album.update
      p "保存成功！"
      session[:album_id] = nil
      redirect_to album_path(current_user)
    else
      p "保存できていません"
    end
  end

  def show
		if User.exists?(id: params[:user_id])
	  		@user = User.find(params[:user_id])
        @album = Album.find(params[:id])
        @photo = Photo.new
        @album.thumbnail_id = @photo
        @album_items = @album.album_items
  		else
        redirect_back fallback_location: { controller: 'users', action: 'index'}
  		end
	end

  def edit
    @arrey = []
    @i = 0
    @count = @arrey.count
    @album = Album.find(params[:id])
    @album_items = @album.album_items
    @a_i_count = @album_itms.count
     puts @arrey
  end

  def update
    @album = Album.find(params[:id])
    binding.pry
    if @album.update
      redirect_to my_albums_path
    else
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :introduction, :thumbnail, :user_id, :event_id, :like_count,
                                                                                album_items_attributes:[[:id,
                                                                                                        :albumm_id,
                                                                                                        :photo_id,
                                                                                                        :_destroy]])
  end

  def album_item_params
    params.require(:album_item).permit(:album_id, :photo_id)
  end
end
