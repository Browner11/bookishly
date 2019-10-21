# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages

  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres, only: %i[index]

  resources :authors, only: %i[index]

  resources :formats, only: %i[index]

  resources :books, only: %i[index]
end
