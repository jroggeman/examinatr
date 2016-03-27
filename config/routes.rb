Rails.application.routes.draw do
  root 'static_pages#home'

  # User Management
  resources :users, only: [:new, :create]
  get 'register' => 'users#new'

  # Session management
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # Temporary ember mount point
  mount_ember_app :frontend, to: '/exams', as: :exams

  get '/exams/:id.pdf' => 'exams#render_for_print'

  # API
  namespace :api do
    namespace :v1 do
      resources :exams, except: [:new, :edit], defaults: { format: 'json' } do
        resources :questions, only: [:show], defaults: { format: 'json' } do
          member do
            post 'move_up'
            post 'move_down'
          end
        end
      end

      resources :questions, only: [:show, :create, :update, :destroy], defaults: { format: 'json' } do
        member do
          post 'move_up'
          post 'move_down'
        end
      end
      post 'login' => 'sessions#create'
    end
  end
end
