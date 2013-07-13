Dictionary::Application.routes.draw do



  root :to => 'home#index'

  match '/about', to: 'static_pages#about'
  match '/contact', to: 'messages#new'

  match '/register', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :terms do
    resources :comments
    resources :phrases
    member do
      get :vote_up
      get :vote_down
      get :add_to_favorites
      get :remove_from_favorites
    end
  end

  resources :varients
  resources :term_varients
  resources :users do
    member do
      get :favorites
    end
  end

  resources :favorites, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :flags, only: [:index, :new, :create, :destroy]
  resources :messages, only: [:index, :new, :create, :destroy]


end
