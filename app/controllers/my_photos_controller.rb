class MyPhotosController < ApplicationController
  def new
    @myphoto = Photo.new
  end

  def create
    @myphoto = Photo.new(myphoto_params)
    @myphoto.user_id = current_user.id
    if @myphoto.save
      redirect_to photos_path
    else
      puts "画像を保存できませんでした"
      render :new
    end
  end

  def index
    @myphotos = Photo.where(user_id: current_user).reverse_order
    @user = current_user
  end

  def show
    @user = current_user
    @photo = Photo.find(params[:id])
    @photo_cnt = Photo.where(user_id: @photo.user_id).count
    require 'mini_exiftool'
    @exif2 = MiniExiftool.new(@photo.image)

    # 位置情報有無テスト用記述
    # a = MiniExiftool.new "public/aa.JPG"
    # p a.to_hash

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
  end

  def pre_photo
    @photo = Photo.find(params[:id])
    pre_photo = @photo.pre
    if pre_photo != nil
      redirect_to my_photo_path(pre_photo)
    else
      @trigger == 1
      @photo = Photo.find(params[:id])
      @exif2 = MiniExiftool.new(@photo.image)

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
      render :show
    end
  end

  def next_photo
    @photo = Photo.find(params[:id])
    next_photo = @photo.next
    if next_photo != nil
      redirect_to my_photo_path(next_photo)
    else
      @trigger == 2
      @photo = Photo.find(params[:id])
      @exif2 = MiniExiftool.new(@photo.image)
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
      render :show
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


    private

    def myphoto_params
      params.require(:photo).permit(:image, :title)
    end


end
