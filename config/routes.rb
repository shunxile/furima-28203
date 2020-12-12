Rails.application.routes.draw do
  devise_for :users
  devise_for :items
  resources :items
  resources :orders do
    resources :purchasa_histories, only: :create
  end
  root to: "items#index"
end
