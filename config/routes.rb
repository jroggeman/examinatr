Rails.application.routes.draw do
  # Start at login page
  root 'sessions#new'

  # Users and exams
  resources :users, only: [:new, :create] do
    resources :exams, except: [:edit, :update, :destroy]
  end

  # Session management
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
