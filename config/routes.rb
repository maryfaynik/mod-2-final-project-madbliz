Rails.application.routes.draw do
  root to: 'application#splash'
  #sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  resources :orders
  resources :madlibs
  resources :users do
    resources :favorites, shallow: true, only: [:index, :destroy]
    resources :trinkets, shallow: true, only: [:index, :update]
  end

  post '/favorites', to: 'favorites#create', as: 'new_favorite'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
