Rails.application.routes.draw do
  devise_for :users
  root to: 'describes#index'
  resources :describes
end
