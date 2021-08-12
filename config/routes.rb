Rails.application.routes.draw do
  
  # home route
  root to: 'home#index'

  #authentication routes
    get "login" => "authentication#signin", as: 'signin'
    post "login" => "authentication#handle_signin"
    get "forgot" => "authentication#forgot", as: 'forgot'
    post "forgot" => "authentication#handle_forgot"
    get "signup" => "authentication#signup", as: 'signup'
    post "signup" => "authentication#handle_signup", as: 'handle_signup'
    delete "logout" => "authentication#logout", as: 'logout'
    
  # profile route
  get "profile" => "profiles#index"

  # resource routes
  namespace :admin do
    resources :users
    resources :categories
    resources :posts
  end

  #### client route #### 
  get "posts/:id" => "client/posts#show", as: 'show'
end
