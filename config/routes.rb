Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :users, only: [ :show ] do
    resources :tweets, only: [ :new, :create, :show, :edit, :update, :destroy ]
    member do
      get :followings, :followers
    end
  end
  resources :tweets, only: [ :index ] do
    resources :likes, only: [ :create, :destroy ]
  end
  resources :likes, only: [ :index ]
  resources :follows, only: [ :create, :destroy ]
end
