Rails.application.routes.draw do
  
  namespace :admins do
    resources :users do
      resources :photos
    end
    # get 'photos/index'
    # get 'photos/show'
  end
  get 'admins/top' => 'admins/users#top', as:'top_admins_path'
  # namespace :admins do
  #   resources :albums do
  #     resources :photos
  #   end
  # end

  # get 'notices/link_through'
	devise_for :admins, controllers: {
  	sessions: 		 'admins/sessions',
  	passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 		 'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

resources :users do
    resources :cameras, only: [:index, :show]
    resources :events
    resources :photos
    resource :follows, only: [:create, :destroy]
    resources :albums do
      resources :my_photos
    end
end

  resources :my_events, only: [:new, :index, :show, :edit, :destroy] do
    resources :albums, only: [:new, :index, :show, :edit, :destroy] do
      resources :photos
    end
  end
    resources :events do
      resources :albums do
        resources :photos
      end
    end


  resources :album_items


resources :photos do
  resource :likes, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
end
resources :my_albums
  # get 'my_albums/new' => 'my_albums#new', as:'new_my_album'

get 'users/top' => 'users#top'
post 'my_albums/:album_id/photo/:id/add_photo' => 'my_albums#add_album_item', as: 'add_my_album_item'
delete 'my_albums/:album_id/photo/:id/del_photo' => 'my_albums#del_album_item', as: 'del_my_album_item'
get 'users/:id/welcome' => 'users#welcome', as: 'welcome_user'
get 'users/:user_id/photos/:id/pre' => 'photos#pre_photo', as: 'photo_pre'
get 'users/:user_id/photos/:id/next' => 'photos#next_photo', as: 'photo_next'
get 'notices/:id/follow_back' => 'notices#follow_back', as: 'follow_back'
get 'notices/:id/link_through' => 'notices#link_through', as: 'link_through'
post 'users/search' => 'users#search', as: 'user_search'
resources :categories, only: [:index]

root 'users#top'
  # get 'events/new'
  # get 'events/index'
  # get 'events/show'
  # get 'events/edit'

# resource :my_album_items
  # get 'my_albums/:id/add_photo' => 'my_albums#add_album_item', as: 'add_my_album_item'
  # get 'my_albums/new'
  # get 'my_albums/index'
  # get 'my_albums/show'
  # get 'my_albums/edit'

  # get 'my_album_items/new'
  # get 'my_album_items/index'
  # get 'my_album_items/edit'

  # get 'albums/index'
  # get 'albums/show'

  # get 'my_photos/new'
  # get 'my_photos/index'
  # get 'my_photos/show'
  # get 'my_photos/edit'
# resources :photos do
	# resources :categories, only: [:index]
# end

  # get 'photos/index'
  # get 'photos/show'

  # get 'categories/index'

# get 'my_events/index'
#   get 'my_events/new'
#   get 'my_events/show'
#   get 'my_events/edit'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
