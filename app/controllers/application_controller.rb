class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters,if: :devise_controller?

# -------------------------------------------------------------------
	helper_method :current_album

	def current_album
		# binding.pry
		if session[:album_id] != nil
			if Album.find_by(id: session[:album_id]).blank?
				session.delete(:album_id)
				@album = Album.create(user_id: current_user.id)
				session[:album_id] = @album.id
				puts session[:album_id]
			else
				@album = Album.find(session[:album_id])
				puts session[:album_id]
			end
		else
			@album = Album.create(user_id: current_user.id, title: "new_album" + Date.today.strftime('%Y%m%d'))
			session[:album_id] = @album.id
			puts session[:album_id]
		end
		puts @album
		return @album
	end
		 # if session[:album_id] != nil
   #    		@album = Album.find(session[:album_id])
   #  	else
   #   		@album = Album.create(user_id: current_user.id)
   #    		session[:album_id] = @album.id
   #  	end


# --------------------------------------------------------------------
	def after_sign_in_path_for(resouece)
		user_path(current_user)
	end

	def after_sign_out_path_for(resouece)
		root_path
	end


	protected

	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :birth_year, :birth_month, :birth_day, :email, :encrypted_password])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :encrypted_password])
    	# devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :email])
  	end


  	private
  		def sign_in_required
  			redirect_to new_user_session_url unless user_signed_in?
  		end

end
