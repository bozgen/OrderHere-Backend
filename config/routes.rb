Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get 'search', to: 'shops#search'

  resources :shops do
    resources :items
    resources :tables do
      resources :requests, only: [:index, :create, :destroy]
      resources :order_items, only: [:index, :create, :update]
    end
  end
  
  get 'shops/:shop_id/tables/:table_id/order_items/current', to: 'order_items#current'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "shops#index"
end
