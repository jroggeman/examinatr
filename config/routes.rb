Rails.application.routes.draw do
  get 'exams/index'

  get 'exams/new'

  get 'exams/create'

  get 'exams/show'

  resources :users, except: [:edit, :update, :destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
