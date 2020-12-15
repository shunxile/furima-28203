Rails.application.routes.draw do
  devise_for :users
  devise_for :items
  resources :items do
    resources :purchase_form
  end
  root to: "items#index"
end
