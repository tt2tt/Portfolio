Rails.application.routes.draw do
  root to: 'tops#top'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'my_page', to: 'users/registrations#my_page', as: 'my_page'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  resources :describes
  # resources :describes do
  #   collection do
  #     get :contributions
  #   end
  # end
  get :contributions, to: 'describes#contributions'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
