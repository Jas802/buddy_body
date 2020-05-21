Rails.application.routes.draw do
  root 'sessions#welcome'
  resources :users, only: [:new, :create, :show] do
    resources :workouts, only: [:index, :show]
  end
  resources :trainers, only:[:new, :create, :index, :show] do
    resources :workouts, only: [:index, :new, :create, :show, :edit, :update]
  end
  resources :workouts, only: [:index, :show, :create, :edit, :update]
  delete 'workout/:id/delete', to: 'workouts#destroy', as: :delete
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  delete 'session/delete', to: 'sessions#delete', as: :logout 
  get "/auth/github/callback" => "sessions#create_from_github"
end
