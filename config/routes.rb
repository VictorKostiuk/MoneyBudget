# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :transactions
  resources :categories
  resources :accounts do
    resources :transactions
  end

  root 'accounts#index'
end
