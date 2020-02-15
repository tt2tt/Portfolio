Rails.application.routes.draw do
  get 'tags/new'
  root to: 'tops#top'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'my_page', to: 'users/registrations#my_page', as: 'my_page'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  get :contributions, to: 'describes#contributions'
  resources :describes do
    resources :comments
  end
  resources :likes, only: [:create, :destroy]
  resources :tags, only: [:new, :create]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
