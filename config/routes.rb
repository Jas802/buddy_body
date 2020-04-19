Rails.application.routes.draw do
  root 'sessions#welcome'
  resources :users, only: [:new, :create, :show] do
    resources :workouts, only: [:index, :show]
  end
  resources :trainers, only:[:index, :show] do
    resources :workouts, only: [:index, :new, :create, :show, :edit]
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'session/delete', to: 'sessions#delete', as: :logout 
  get "/auth/:provider/callback" => "sessions#create_from_github"
end
