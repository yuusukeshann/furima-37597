Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new,:create,:show,:edit,:update,:destroy] do
    resources :purchase_records, only: [:index, :create]
    end
resources :shipping_adresses, only: :create
end
