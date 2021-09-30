Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"
  #get "users", to: "users#index"
  post "users/login", to: "users#login"
  #get "users/:id", to: "users#show"
  resources :users
  resources :todos
end
