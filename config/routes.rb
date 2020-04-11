Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root 'sessions#welcome'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
end
