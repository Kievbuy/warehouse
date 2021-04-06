Rails.application.routes.draw do
  root to: 'products#index'

  resources :references
  resources :categories
  resources :products
  resources :destinations
end
