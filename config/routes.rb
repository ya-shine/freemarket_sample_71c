Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'address', to: 'users/registrations#new_address'
    post 'address', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resource :item
  resource :order
  resource :shipping_addresses
  resources :mypage, only: :index
end
