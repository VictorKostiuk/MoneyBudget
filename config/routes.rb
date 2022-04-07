# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :transactions
  resources :accounts do
    resources :transactions
  end

  root 'accounts#index'
end
