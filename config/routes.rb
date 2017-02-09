Rails.application.routes.draw do
  devise_for :admins
  root 'welcome#index'
  resources :carts
  resources :order_items
  resources :orders
  resources :products, only: [:show]

  namespace :admin do
    resources :products
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
