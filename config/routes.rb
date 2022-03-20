# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :checks
  resources :total_sums do
    resources :checks
  end

  root "total_sums#index"
end
