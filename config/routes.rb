Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'shipping_addresses', to: 'users/registrations#new_shipping_address'
    post 'shipping_addresses', to: 'users/registrations#create_shipping_address'
  end
  root 'items#index'
  resources :items
  resource :order
  resources :shipping_addresses
  resources :mypage, only: :index
  resources :credit_cards, only: [:index, :new]
end
