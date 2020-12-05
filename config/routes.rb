Rails.application.routes.draw do
  devise_for :users
  devise_for :items
  resources :items
  resources :purchase_histories
  root to: "items#index"
end
