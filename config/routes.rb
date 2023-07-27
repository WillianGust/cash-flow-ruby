Rails.application.routes.draw do
  # get 'home', to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  
  get "delete/:id", to: "home#delete"
  get "add", to: "home#add"
  post "add", to: "home#register"

  get "api/cashes", to: "api#index"
  delete "api/cashes/:id", to: "api#delete"
  post "api/cashes", to: "api#register"
end
