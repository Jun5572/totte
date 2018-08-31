class Admins::UsersController < ApplicationController

	def top
		
	end

	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
	end
end
