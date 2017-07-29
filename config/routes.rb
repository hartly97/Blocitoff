Rails.application.routes.draw do

  get 'items/edit'

  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy] do
      put :toggle
    end
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  #get 'items/new'

  #root 'user#show'

  root 'welcome#index'
  end
