Dictionary::Application.routes.draw do
  resources :varients
  resources :term_varients


  resources :terms do
    resources :comments
    
  end

  get "links/index"
  get "home/index"

  root :to => 'home#index'

end
