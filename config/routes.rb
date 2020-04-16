Rails.application.routes.draw do
  root 'sessions#welcome'
  resources :users, only: [:new, :create, :show]
  resources :workouts, only: [:index, :new, :create, :show]
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete '/session/', to: 'session#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
end
