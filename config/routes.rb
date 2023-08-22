Rails.application.routes.draw do
  root "pages#index"

  get "/signup", to: "users#new", as: "signup"

  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create", as: "new_user_session"
  delete  "/logout", to: "sessions#destroy", as: "logout"

  resources :articles
  resources :users
  resources :profiles
end
