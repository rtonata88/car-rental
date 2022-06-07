# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :cars, only: %i[index show]
  resources :users, only: %i[create destroy] do
    resources :favorites, only: %i[index create destroy]
  end
  post '/login', to: 'auth#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
