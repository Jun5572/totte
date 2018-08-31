class Admins::PhotosController < ApplicationController
  def index
  	@photo = Photo.all
  end

  def show
  	@photo = Photo.find(params[:id])
  end
end
