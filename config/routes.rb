Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get 'search', to: 'shops#search'

  resources :shops do
    resources :items
    resources :tables do
      resources :requests, only: [:index, :create]
      resources :order_items, only: [:index, :create]
    end
  end
  # order items
  get     'shops/:shop_id/tables/:table_id/order_items/current', to: 'order_items#current'
  get     'shops/:shop_id/order_items', to: 'order_items#current_all'
  put     'shops/:shop_id/tables/:table_id/order_items', to: 'order_items#update'
  delete  'shops/:shop_id/tables/:table_id/order_items', to: 'order_items#destroy'
  # requests
  get 'shops/:shop_id/requests', to: 'requests#index_by_shop'
  delete 'shops/:shop_id/requests/:id', to: 'requests#destroy'
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "shops#index"
end
