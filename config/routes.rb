Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  resources :posts
  resources :notifications, only: [:index]

  resources :users, only: [:index] do
    member do
      get '', action: :profile, as: :profile
      get 'follow', action: :follow, as: :follow
      get 'unfollow', action: :unfollow, as: :unfollow
    end
  end

  controller :home, path: :home do
    get 'last_posts', action: :last_posts, as: :last_posts
  end

  controller :searches, path: :searches do
    get '/', action: :index, as: :search
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'
end
