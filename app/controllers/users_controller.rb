class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:top]

	def top
	end

  def index
    @user = current_user
    @photo = Photo.new
    # @rand_photo = Photo.order("RANDOM()").first
    # @photos = Photo.all.order(created_at: :desc)
    @photos = Photo.page params[:page]
  end

  def search
    @user = current_user
    @result= User.search(params[:search])
  end

  def show
      @photo = Photo.new
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
      @photos = @user.photos.order(created_at: :desc)
      # @like_hash = Like.where(user_id: current_user.id).pluck(:id, :photo_id).to_h
    else
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
    # redirect_back fallback_location: { controller: 'users', action: 'show' }
    redirect_to user_path(user)
    end
  end

  def destroy

  end

  private


  def user_params
    params.require(:user).permit(:first_mane, :last_name, :nickname, :email, :header_image, :thumbnail)
  end
end
