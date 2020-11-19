Rails.application.routes.draw do
  devise_for :users
  devise_for :items
  resources :users, only: [:new, :create]
  resources :items
  root to: "items#index"
end
