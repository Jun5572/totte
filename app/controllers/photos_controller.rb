class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :sign_in_required, only: [:index]

  def new
    @photo = Photo.new
  end

  def index
    @myphotos = Photo.where(user_id: current_user).reverse_order
    @user = current_user
  end

  def create
    photo = Photo.new(photo_params)
    photo.user_id = current_user.id
    if photo.save
      redirect_to user_path(current_user)
    else
      puts "画像を保存できませんでした"
      render :new
    end
  end

  def show
    # @user = current_user
    @user = User.find(params[:user_id])
    @photo = Photo.find_by(user_id: @user, id: params[:id])
    @photos = @user.photos
    @photo_cnt = @photos.count
    # binding.pry
    require 'mini_exiftool'
    @exif2 = MiniExiftool.new(@photo.image)
    puts @exif2.to_hash

    # 位置情報取得

    @make = @exif2.to_hash["Make"]
    if @make == nil
      @make = "no data"
    end

    @model = @exif2.to_hash["Model"]
    if @model == nil
      @model = "no data"
    end

    @f_number = @exif2.to_hash["FNumber"]
    if @f_number == nil
      @f_number = "no data"
    end

    @shooting = @exif2.to_hash["DateTimeOriginal"]
    if @shooting == nil
      @shooting = "no data"
    end

    @camflash = @exif2.to_hash["Flash"]
    if @camflash == nil
      @camflash = "no data"
    end
# 焦点距離
    @focallength = @exif2.to_hash["FocalLength"]
    if @focallength == nil
      @focallength = "no data"
    end

    @picture_mode = @exif2.to_hash["PictureControlName"]
    if @picture_mode == nil
      @picture_mode = "no data"
    end

    @lens_spec = @exif2.to_hash["LensSpec"]
    if @lens_spec == nil
      @lens_spec = "no data"
    end

    @scene_mode = @exif2.to_hash["SceneCaptureType"]
    if @scene_mode == nil
      @scene_mode = "no data"
    end

    @photo_size = @exif2.to_hash["ImageSize"]
    if @photo_size == nil
      @photo_size = "no data"
    end

    @iso = @exif2.to_hash["ISO"]
    if @iso == nil
      @iso = "no data"
    end
  end

  def pre_photo
    @a = 0
    @photo = Photo.find(params[:id])
    @user = @photo.user
    @pre_photo = @photo.pre
    if @pre_photo != nil && @pre_photo.user == @user
      redirect_to user_photo_path(@user, @pre_photo)
    else
      puts 'この先に画像はありません'
      @a = 1
      redirect_to user_photo_path(@user, @photo)
      # require 'mini_exiftool'
      # @exif2 = MiniExiftool.new(@photo.image)
    end
  end

  def next_photo
    @a = 0
    # @photo = Photo.find_by(user_id: @user.id)
    # @photo = Photo.find_by(user_id: @user, id: params[:id])
    @photo = Photo.find(params[:id])
    @user = @photo.user
    @next_photo = @photo.next
    if @next_photo != nil && @next_photo.user == @user
      redirect_to user_photo_path(@user, @next_photo)
    else
      puts 'この先に画像はありません'
      @a = 2
      redirect_to user_photo_path(@user, @photo)
      # require 'mini_exiftool'
      # @exif2 = MiniExiftool.new(@photo.image)
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    @album_item = AlbumItem.find_by(photo_id: photo.id)
    photo.destroy
    redirect_to user_path(current_user)
  end


  private

    def photo_params
      params.require(:photo).permit(:image, :title)
    end
end
