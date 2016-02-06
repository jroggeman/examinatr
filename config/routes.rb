Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :create]

  resources :exams, except: [:edit, :update] do
    # Questions are sub-resource
    resources :questions, except: [:index, :destroy]

    # Explicit render path
    get 'render_for_print', on: :member
  end

  # Session management
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # User Management
  get 'register' => 'users#new'
end
