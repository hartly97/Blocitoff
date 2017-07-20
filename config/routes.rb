Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :users, only: [:show] do
      resources :items, only: [:create, :destroy]
  end

  #devise_for :users
  #resources :users, only: [:show] do
    #resources :items, only: [:create]
  #end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  get 'items/new'

  root 'users#show'
end
