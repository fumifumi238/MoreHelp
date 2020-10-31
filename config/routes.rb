Rails.application.routes.draw do
  resources :users
  get "posts/new" => "posts#new"
  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/comments/create" => "comments#create"
  post "posts/create"=>"posts#create"
  root "home#top"
  get "/about" => "home#about"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/:id" => "users#show"
  get "/login" => "users#login_form"
  post "/login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
