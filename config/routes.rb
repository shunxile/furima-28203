Rails.application.routes.draw do
  devise_for :users
  devise_for :items
  resources :items do
    resources :purchase_form
  end
  # resources :purchase_form do
  #   resources :address, only: :create
  #     member do
  #       get 'create'
  #     end
  # end
  root to: "items#index"
end
