Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :create]
  resource :order
  resource :shipping_addresses
  resources :mypage, only: :index
end
