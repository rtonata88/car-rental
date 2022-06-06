Rails.application.routes.draw do
  resources :cars, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create, :destroy] do
    resources :favorites, only: [:index, :create, :destroy]
  end
  post "/login", to: "auth#login"

end
