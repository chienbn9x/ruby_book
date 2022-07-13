Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

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

  # address
  resources :addresses, only: [:index]
end
