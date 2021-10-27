Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: [:index, :new, :create, :show, :edit]

  resources :items, only: [:show] do
    resources :orders, only: [:index, :create]
  end
  
end
