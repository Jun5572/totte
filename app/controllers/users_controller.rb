class UsersController < ApplicationController
	def top
	end
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
  end

  def destroy
  end
end
