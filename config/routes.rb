# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users

  resources :clients
  resources :orders

  namespace :reports do
    resources :top_clients, only: :index
  end

  root 'orders#index'
end
