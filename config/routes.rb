Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users, only: [:new, :create]

  resources :exams do
    # Questions are sub-resource
    resources :questions, except: [:index]

    # Explicit render path
    get 'render_for_print', on: :member
  end

  # Session management
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # User Management
  get 'register' => 'users#new'

  # Ember API for SPA
  mount_ember_app :frontend, to: '/api/v1'
end
