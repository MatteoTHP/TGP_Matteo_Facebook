Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :gossip 

  resources :author
  resources :city

 # definit tous les chemins
  root to: 'gossip#index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get '/welcome/:id', to: 'static#hidden'
  
  
end
