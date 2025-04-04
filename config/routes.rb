Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :users, only: [ :show ] do
    resources :tweets, only: [ :new, :create, :edit, :update, :destroy ]
  end
  resources :tweets, only: [ :index ]
end
