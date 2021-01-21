Rails.application.routes.draw do
  root 'static#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :ghosts, only: [:index]
  resources :appointments
  resources :ghostbusters
  resources :users do
    resources :ghosts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
