Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  root to: 'customers#index'

  resources :customers

  root to: 'orders#index'

  resources :orders

  root to: 'menus#index'

  resources :menus

  root to: 'stores#index'

  resources :stores

  root to: 'toppings#index'

  resources :toppings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
