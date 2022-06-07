# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :cars, only: %i[index show]
  resources :users, only: %i[create destroy] do
    resources :favorites, only: %i[index create destroy]
  end

  post "/login", to: "auth#login"
end
