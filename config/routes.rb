Rails.application.routes.draw do
  root to: 'tops#top'
  devise_for :users
  resources :users, only: [:show]
  resources :describes

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
