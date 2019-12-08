Rails.application.routes.draw do
  root to: 'describes#index'
  devise_for :users
  resources :users, only: [:show]
  resources :describes
end
