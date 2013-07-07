Dictionary::Application.routes.draw do

  root :to => 'home#index'

  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  match '/register', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :terms do
    resources :comments 
  end

  resources :varients
  resources :term_varients
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
end
