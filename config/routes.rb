Rails.application.routes.draw do
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
