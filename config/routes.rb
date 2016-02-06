Rails.application.routes.draw do
  # Start at login page
  root 'sessions#new'

  # Users and exams
  resources :users, only: [:new, :create]
  resources :exams, except: [:edit, :update] do
    get 'render_for_print', on: :member
    resources :questions, only: [:new, :create, :show, :edit, :update]
  end

  # Session management
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # User Management
  get 'register' => 'users#new'
end
