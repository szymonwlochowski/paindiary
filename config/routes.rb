Rails.application.routes.draw do
  devise_for :users

  resources :posts
  resources :users
  resources :descriptions

  root to: 'home#index'
end
