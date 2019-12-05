Rails.application.routes.draw do
  root to: 'describes#index'
  resources :describes
end
