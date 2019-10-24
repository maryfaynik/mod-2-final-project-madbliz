Rails.application.routes.draw do
  
  root to: 'application#splash'

  #sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/products', to: 'sessions#add_to_cart'
  get '/cart', to: 'sessions#show_cart', as: 'cart'
  
  resources :orders, only: [:create, :show, :index]

  resources :madlibs, only: [:new, :create, :show] do
    get '/products', to: 'sessions#products', as: 'new_cart'
  end

  resources :users do 
    resources :favorites, shallow: true, only: [:index]
    resources :trinkets, shallow: true, only: [:index, :show]
  end

  post '/favorites', to: 'favorites#create', as: 'new_favorite'
  delete '/favorite/:id', to: 'favorites#destroy', as: 'delete_favorite'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
