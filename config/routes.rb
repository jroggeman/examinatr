Rails.application.routes.draw do
  # Start at login page
  root 'sessions#new'

  # Users and exams
  resources :users, except: [:edit, :update, :destroy]
  resources :exams, except: [:edit, :update, :destroy]

  # Session management
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
