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
    @photo = Photo.find(params[:id])
    @exif = MiniExiftool.new(@photo)
    binding.pry
    
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
