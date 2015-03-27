Rails.application.routes.draw do
  get 'oauths/oauth'

  get 'oauths/callback'

  root 'home#index'
  get 'home/index'

  resources :likes

  resources :photos do
    resources :reviews, only: [:show, :create, :destroy]
  end 

  resources :classifieds do 
    resources :posters, only: [:show, :create, :destroy]
  end 


  resources :users
  resources :user_sessions
  resources :photo_categories
  resources :classified_categories

  get 'hours'  => 'services#hours', as: :hours
  get 'about' => 'services#about', as: :about
  get 'site_map' => 'services#site_map', as: :site_map
  get 'contact' => 'services#contact', as: :contact

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # root 'builds#index'
  resources :calc 
  resources :builds

post "oauth/callback" => "oauths#callback"
get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end
