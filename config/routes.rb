Rails.application.routes.draw do
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
resources :users
  get 'users/top' => 'users#top'

  
resources :companies, only: [:show, :edit]
  # get 'companies/show'
  # get 'companies/edit'
resources :cameras, only: [:index, :show]
  # get 'cameras/index'
  # get 'cameras/show'


resources :events
  # get 'events/new'
  # get 'events/index'
  # get 'events/show'
  # get 'events/edit'

resources :my_albums do
	resources :my_album_items
end
  # get 'my_albums/new'
  # get 'my_albums/index'
  # get 'my_albums/show'
  # get 'my_albums/edit'

  # get 'my_album_items/new'
  # get 'my_album_items/index'
  # get 'my_album_items/edit'

resources :albums, only: [:index, :show]
  # get 'albums/index'
  # get 'albums/show'

resources :my_photos do
	resource :categories, only: [:index]
end
  # get 'my_photos/new'
  # get 'my_photos/index'
  # get 'my_photos/show'
  # get 'my_photos/edit'
resources :photos, only: [:index, :show] do
	resource :categories, only: [:index]
end
  # get 'photos/index'
  # get 'photos/show'

  # get 'categories/index'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
