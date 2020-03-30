# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :clients
  resources :orders

  namespace :reports do
    resources :top_clients, only: :index
  end

  root 'orders#index'
end
