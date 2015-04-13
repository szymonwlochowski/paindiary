Rails.application.routes.draw do

  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Forem::Engine, :at => '/forums'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
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

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
