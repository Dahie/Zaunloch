Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers:
      { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/oauth_failure' => 'login#oauth_failure'

  get 'home/index'
  resources :notebooks, only: %i[new create update destroy]
end
