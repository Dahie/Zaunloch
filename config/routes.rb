Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users,
             path: 'auth'

  get 'home/index'
end
