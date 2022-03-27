Rails.application.routes.draw do
  resources :shops do
    resources :items
    resources :tables do
      resources :requests, only: [:index, :create, :destroy]
      resources :order_items, only: [:index, :create, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
