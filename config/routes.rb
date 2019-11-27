# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :clients
  resources :orders

  root 'orders#index'
end
