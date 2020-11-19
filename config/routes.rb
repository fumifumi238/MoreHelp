Rails.application.routes.draw do
 root "home#top"
 get "/about", to: "home#about"
 get    '/login',   to: 'sessions#new'
 post   '/login',   to: 'sessions#create'
 delete '/logout',  to: 'sessions#destroy'
 resources :users
 resources :posts do
   resources :comments
 end
end
