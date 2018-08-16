class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters,if: :devise_controller?


	helper_method :current_album

	def current_album
		# binding.pry
		if session[:album_id] != nil
			@album = Album.find(session[:album_id])
		else
			@album = Album.create(user_id: current_user.id)
			session[:album_id] = @album.id
		end
	end
end
