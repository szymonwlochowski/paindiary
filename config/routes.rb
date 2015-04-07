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

  get '/about' => 'home#about'
  get '/help' => 'home#help'
  get '/faq' => 'home#faq'

  root to: 'home#index'
end
