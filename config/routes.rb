Rails.application.routes.draw do
  resources :order_items
  resources :requests
  resources :shop_types
  resources :item_types
  resources :shops do
    resources :items
    resources :tables
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
