class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:top]
  before_action :sign_in_required, only: [:show, :welcome]
  # protect_from_forgery except: :search

	def top
	end

  def welcome
    @photo = Photo.new
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
    @result = User.find_by('nickname LIKE ?', "%#{params[:search]}%")
    if @result == nil
      redirect_back(fallback_location: user_path(current_user))
    else
      redirect_to user_path(@result.id)
    end
  end

  def show
      @photo = Photo.new
    # if User.exists?(id: params[:id])
      @user = User.find(params[:id])
      @photos = @user.photos.order(created_at: :desc)
      # @like_hash = Like.where(user_id: current_user.id ).pluck(:id, :photo_id).size
      @likes_count = Photo.where(user_id: @user.id).pluck(:like_count).sum
    # else
    # end
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


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :header_image, :thumbnail)
  end
end
