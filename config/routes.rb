Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root
  root 'welcome#index'

  # categories
  resources :categories, only: [:show]

  # products
  resources :products, only: [:index, :show]

  # carts
  resources :carts, only: [:index]

  # order 
  resources :orders, only: [:create, :destroy]
  post '/orders/:id/dec', to: 'orders#dec', as: 'order_dec'
  post '/orders/:id/inc', to: 'orders#inc', as: 'order_inc'
end
