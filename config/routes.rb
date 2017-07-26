Rails.application.routes.draw do


  #devise_for :users
  #resources :users, only: [:show] do
  #  resources :items, only: [:create]
  #end

  #get 'items/new'

  #root 'user#show'
#end

devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  #get 'items/new'

  #root 'user#show'

  root 'welcome#index'
  end
