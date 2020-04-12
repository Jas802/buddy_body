Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root 'sessions#welcome'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete '/session/', to: 'session#destroy'
  get '/workouts', to: 'workouts#index' as: 'workouts'
  # Routes for Google authentication
#get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
#get ‘auth/failure’, to: redirect(‘/’)
end
