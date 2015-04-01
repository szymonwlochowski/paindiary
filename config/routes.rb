Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Forem::Engine, :at => '/forums'

  devise_for :users

  resources :posts
  resources :users do
    member do
      put :update_layout
    end
  end
  resources :descriptions

  root to: 'home#index'
end
