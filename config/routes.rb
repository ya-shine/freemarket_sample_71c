Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :item
end
