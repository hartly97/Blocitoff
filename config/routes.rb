Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }

<<<<<<< HEAD
  resources :users, only: [:show] do
      resources :items, only: [:create, :destroy]
  end

  #devise_for :users
  #resources :users, only: [:show] do
    #resources :items, only: [:create]
  #end

=======

  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy] do
      put :toggle
    end
  end

>>>>>>> Jose
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  #get 'items/new'

  #root 'user#show'

  root 'welcome#index'
  end
