# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages

  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres, only: %i[index show]

  resources :authors, only: %i[index show]

  resources :formats, only: %i[index show]

  resources :books, only: %i[index show]

  root to: 'books#index'
end
