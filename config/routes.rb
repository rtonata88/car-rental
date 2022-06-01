Rails.application.routes.draw do
  resources :cars, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create, :destroy] do
    resources :favorites, only: [:index, :create, :destroy]
  end
  post "/login", to: "auth#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
  # root "articles#index"
end
