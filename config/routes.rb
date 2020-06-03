Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resource :item
  resource :order
  resource :shipping_addresses
end
