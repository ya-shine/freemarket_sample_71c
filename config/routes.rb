Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'shipping_addresses', to: 'users/registrations#new_shipping_address'
    post 'shipping_addresses', to: 'users/registrations#create_shipping_address'
  end
  root 'shops#index'
  resources :shops, only: :index
  post 'items/new', to:'items#create'
  patch 'items/:id/edit', to: 'items#update'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
    resource :order, only: [:new,:create] do
      collection do
        get 'done', to: 'orders#done'
      end
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index,:show]
  resources :shipping_addresses
  resources :credit_cards, only: [:index, :new, :show, :create,:destroy]
  resources :users, only: [:index, :show] do
    collection do
      get :likes
    end
  end
end
