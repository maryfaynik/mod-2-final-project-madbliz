Rails.application.routes.draw do
  resources :orders
  resources :madlibs
  resources :users do
    resources :favorites, shallow: true, only: [:index, :destroy]
    resources :trinkets, shallow: true, only: [:index, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
