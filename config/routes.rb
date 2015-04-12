Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Forem::Engine, :at => '/forums'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts do
    member do
      get :remove_element
    end
  end
  resources :users do
    member do
      put :update_layout
    end
  end
  resources :descriptions

  get '/about' => 'home#about'
  get '/help' => 'home#help'
  get '/faq' => 'home#faq'
  get '/charts' => 'posts#charts'

  root to: 'devise/sessions#new'
end
